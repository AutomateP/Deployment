' //***************************************************************************
' // ***** Script Header *****
' //
' // Solution: Custom Script for MDT or ConfigMgr OSD
' // File: OSDRunActionAfterTaskSequence.vbs
' //
' // Purpose: Script used to shutdown, restart, or logoff after the Task Sequencer 
' //          has exited.
' //
' // Usage: cscript.exe OSDRunActionAfterTaskSequence.vbs /Action:"<command to run>"
' //                    [/Delay:<delay (sec) after TS ends before running command>]
' //
' // Version: 2.0.0
' //
' // History:
' // 1.0.0   04/17/2012   Created script.
' // 2.0.0   07/06/2012   Extensive rewrite.
' //
' // ***** End Header *****
' //*************************************************************************** 

On Error Resume Next

' Constants

Const ForReading = 1
Const ForWriting = 2
Const ForAppending = 8

Const Success = 0
Const Failure = 1

Const LogTypeInfo = 1
Const LogTypeWarning = 2
Const LogTypeError = 3
Const LogTypeVerbose = 4
Const LogTypeDeprecated = 5

Const TextCompare = 1

Const adOpenStatic = 3
Const adLockReadOnly = 1
Const adLockOptimistic = 3


' Initialize the objects

Set oFSO = CreateObject("Scripting.FileSystemObject")
Set oShell = CreateObject("WScript.Shell")
Set oEnv = oShell.Environment("PROCESS")
Set oNetwork = CreateObject("WScript.Network")

Set objWMI = Nothing
On Error Resume Next
Set oContext = CreateObject("WbemScripting.SWbemNamedValueSet")
oContext.Add "__ProviderArchitecture", 64
Set oLocator = CreateObject("Wbemscripting.SWbemLocator")
Set objWMI = oLocator.ConnectServer("","root\cimv2","","",,,,oContext)
On Error Goto 0


' Global variables

ScriptFolder = Left(WScript.ScriptFullName, Len(WScript.ScriptFullName) - (Len(WScript.ScriptName) + 1))
'LogPath = ScriptFolder
LogPath = oEnv("Temp")
Component = oFSO.GetBaseName(WScript.ScriptName)
LogFile = Component & ".log"
bDebug = False


'Get arguments

If WScript.Arguments.Named.Exists("Action") Then
    sAction = WScript.Arguments.Named("Action")
    CreateEntry "Action requested: " & sAction, LogTypeInfo
Else
    CreateEntry "No Action requested.  Exiting script.", LogTypeError
    WScript.Quit Failure
End If

If WScript.Arguments.Named.Exists("Delay") Then
    iDelay = WScript.Arguments.Named("Delay")
    CreateEntry "Delay requested (seconds): " & iDelay, LogTypeInfo
    If Not IsNumeric(iDelay) Then
        CreateEntry "Delay is not numeric.  Exiting script.", LogTypeError
         WScript.Quit Failure
    End If
End If


'Start main script tasks

WaitForTaskSequenceToEnd

If iDelay <> "" Then WScript.Sleep CLng(iDelay) * 1000

iActionRetVal = RunCommand(sAction)
WScript.Echo iActionRetVal
WScript.Quit iActionRetVal


'********************************************************************
'* Procedures
'********************************************************************
Function WaitForTaskSequenceToEnd()

    strComputer = "."
    Set objWMIService = GetObject("winmgmts:" _
        & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")

    Set colMonitoredProcesses = objWMIService. _        
        ExecNotificationQuery("select * From __InstanceDeletionEvent" _ 
            & " Within 5 Where TargetInstance Isa 'Win32_Process'" _
            & " And TargetInstance.Name = 'TSManager.exe'")

    i = 0
    Do While i = 0
        Set objLatestProcess = colMonitoredProcesses.NextEvent
        CreateEntry objLatestProcess.TargetInstance.Name & " process exited.", LogTypeInfo
        Exit Do
    Loop

    WaitForTaskSequenceToEnd = True

End Function


Function RunCommand(sCmd)

    CreateEntry "RunCommand function: About to run command: " & sCmd, LogTypeInfo

    On Error Resume Next    
    Err.Clear
    iRetVal = oShell.Run(sCmd, 1, false)
    If Err then
        RunCommand = Err.Number
        CreateEntry "RunCommand function: ERROR running command """ & sCmd & """: " & Err.Description & " (" & Err.Number & ")", LogTypeError
        EXIT FUNCTION
    ElseIf iRetVal <> Success then
        RunCommand = iRetVal
        CreateEntry "RunCommand function: ERROR running command """ & sCmd & """, rc = " & iRetVal, LogTypeError
        EXIT FUNCTION
    Else
        RunCommand = Success
        CreateEntry "RunCommand function: Successfully ran command: " & sCmd, LogTypeInfo
    End if
    On Error Goto 0

End Function


Public Function CreateEntry(sLogMsg, iType)
    Dim sTime, sDate, sTempMsg, oLog, bConsole


    ' Each of the operations below has the potential to cause a runtime error.
    ' However, we must not stop operation if there is a failure, so allways continue.

    On Error Resume Next


    ' Special Handling for Debug vs. Non-Debug messages

    If not bDebug then

        If iType = LogTypeVerbose Then
            Exit Function  ' Verbose Messages are only displayed when Debug = True
        Elseif iType = LogTypeDeprecated Then
            iType = LogTypeInfo ' Deprecated messages are normally Info messages
        End if

        ' Suppress messages containing password

        If Instr(1, sLogMsg, "password", 1) > 0 then
            sLogMsg = "<Message containing password has been suppressed>"
        End if

    Else  ' Debug = True

        If iType = LogTypeVerbose then
            iType = LogTypeInfo
        Elseif iType = LogTypeDeprecated Then
            iType = LogTypeError
        End if

    End if


    ' Populate the variables to log

    sTime = Right("0" & Hour(Now), 2) & ":" & Right("0" & Minute(Now), 2) & ":" & Right("0" & Second(Now), 2) & ".000+000"
    sDate = Right("0"& Month(Now), 2) & "-" & Right("0" & Day(Now), 2) & "-" & Year(Now)
    sTempMsg = "<![LOG[" & sLogMsg & "]LOG]!><time=""" & sTime & """ date=""" & sDate & """ component=""" & Component & """ context="""" type=""" & iType & """ thread="""" file=""" & Component & """>"


    ' Make sure the LogPath directory exists

    If oFSO.FolderExists(LogPath) then
        iRetVal = oShell.Run("cmd /c md """ & LogPath & """",0, true)
    End If


    ' If debug, echo the message

    bConsole = InStr(1,Wscript.FullName,"CSCRIPT.EXE", vbTextCompare ) <> 0
    If bConsole = True then
        Wscript.echo sLogMsg
    End if


    ' Create the log entry

    Set oLog = oFSO.OpenTextFile(LogPath & "\" & LogFile, ForAppending, True)
    oLog.WriteLine sTempMsg
    oLog.Close

    On error goto 0

End Function


