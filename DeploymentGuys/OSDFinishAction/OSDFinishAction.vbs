' //***************************************************************************
' // ***** Script Header *****
' //
' // Solution: Custom Script for MDT or ConfigMgr OSD
' // File: OSDFinishAction.vbs
' //
' // Purpose: Script used to shutdown, restart, or logoff after the Task Sequencer 
' //          has exited.
' //
' // Usage: cscript.exe OSDFinishAction.vbs /FinishAction:<action>
' //                    [/FinishActionDelay:<action delay>]
' // 
' //        Where action is one of the following:
' //          - SHUTDOWN. Shuts down the target computer.
' //          - REBOOT. Restarts the target computer.
' //          - RESTART. Same as REBOOT.
' //          - LOGOFF. Log off the current user. If the target computer is currently
' //            running Windows PE, then no action is taken.
' //          - blank. Exit without performing any additional actions. This is the default setting.
' //        Where action delay is the number of seconds to delay before executing
' //        the action.
' //
' // Version: 1.0.0
' //
' // History:
' // 1.0.0   07/06/2012   Created script.
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

'Shutdown Method Constants
CONST CONST_SHUTDOWN                = 1
CONST CONST_LOGOFF                  = 0
CONST CONST_POWEROFF                = 8
CONST CONST_REBOOT                  = 2
CONST CONST_FORCE_REBOOT            = 6
CONST CONST_FORCE_POWEROFF          = 12
CONST CONST_FORCE_LOGOFF            = 4
CONST CONST_FORCE_SHUTDOWN          = 5


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

If WScript.Arguments.Named.Exists("FinishAction") Then
    sFinishAction = WScript.Arguments.Named("FinishAction")
    CreateEntry "FinishAction requested: " & sFinishAction, LogTypeInfo
    Select Case UCase(sFinishAction)
        Case "SHUTDOWN", "RESTART", "REBOOT", "LOGOFF", ""
            'Valid entry
        Case Else
            CreateEntry "Invalid FinishAction requested.  Exiting script.", LogTypeError
            WScript.Quit Failure
    End Select
Else
    CreateEntry "No FinishAction requested.  Exiting script.", LogTypeError
    WScript.Quit Failure
End If

If WScript.Arguments.Named.Exists("FinishActionDelay") Then
    iFinishActionDelay = WScript.Arguments.Named("FinishActionDelay")
    CreateEntry "FinishActionDelay requested (seconds): " & iFinishActionDelay, LogTypeInfo
    If Not IsNumeric(iFinishActionDelay) Then
        CreateEntry "FinishActionDelay is not numeric.  Exiting script.", LogTypeError
         WScript.Quit Failure
    End If
End If


'Start main script tasks

WaitForTaskSequenceToEnd

If iFinishActionDelay <> "" Then WScript.Sleep CLng(iFinishActionDelay) * 1000

Select Case UCase(sFinishAction)
    Case "SHUTDOWN"
        Shutdown
    Case "RESTART", "REBOOT"
        Reboot
    Case "LOGOFF"
        Logoff
    Case ""
        WScript.Quit
    Case Else
        CreateEntry "Invalid FinishAction requested.  Exiting script.", LogTypeError
        WScript.Quit Failure
End Select


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


Sub Reboot

    Dim o, oOS

    ' Reboot

    If oEnv("SystemDrive") = "X:" then
        ' Nothing to do, exiting will reboot
    Else
        CreateEntry "Executing restart.", LogTypeInfo
        Set oOS = GetObject("winmgmts:{(Shutdown)}//./root/cimv2").ExecQuery("select * from Win32_OperatingSystem where Primary=true")
        For Each o in oOS
            o.Win32Shutdown(CONST_FORCE_REBOOT)
        Next
    End if

End Sub


Sub Shutdown

    Dim o, oOS

    ' Shutdown

    If oEnv("SystemDrive") = "X:" then
        CreateEntry "Executing WinPE shutdown.", LogTypeInfo
        oShell.Run "WpeUtil.exe shutdown", 0, true
        WScript.Sleep 60000
    Else
        CreateEntry "Executing shutdown.", LogTypeInfo
        Set oOS = GetObject("winmgmts:{(Shutdown)}//./root/cimv2").ExecQuery("select * from Win32_OperatingSystem where Primary=true")
        For Each o in oOS
            o.Win32Shutdown(CONST_FORCE_POWEROFF)
        Next
    End if

End Sub



Sub Logoff

    Dim o, oOS

    ' Logoff

    If oEnv("SystemDrive") = "X:" then
        ' Logoff is impossible, just exit so it reboots
    Else
        CreateEntry "Executing logoff.", LogTypeInfo
        Set oOS = GetObject("winmgmts:{(Shutdown)}//./root/cimv2").ExecQuery("select * from Win32_OperatingSystem where Primary=true")
        For Each o in oOS
            o.Win32Shutdown(CONST_FORCE_LOGOFF)
        Next
    End if

End Sub


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


