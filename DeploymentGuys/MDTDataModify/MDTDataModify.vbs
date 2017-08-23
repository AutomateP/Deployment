'#########################################################################################
'#   MICROSOFT LEGAL STATEMENT FOR SAMPLE SCRIPTS/CODE
'#########################################################################################
'#   This Sample Code is provided for the purpose of illustration only and is not 
'#   intended to be used in a production environment.
'#
'#   THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY 
'#   OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED 
'#   WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
'#
'#   We grant You a nonexclusive, royalty-free right to use and modify the Sample Code 
'#   and to reproduce and distribute the object code form of the Sample Code, provided 
'#   that You agree: 
'#   (i)      to not use Our name, logo, or trademarks to market Your software product 
'#            in which the Sample Code is embedded; 
'#   (ii)     to include a valid copyright notice on Your software product in which 
'#            the Sample Code is embedded; and 
'#   (iii)    to indemnify, hold harmless, and defend Us and Our suppliers from and 
'#            against any claims or lawsuits, including attorneys’ fees, that arise 
'#            or result from the use or distribution of the Sample Code.
'#########################################################################################

' // ***************************************************************************
' // 
' // Copyright (c) Microsoft Corporation.  All rights reserved.
' // 
' // Microsoft Deployment Toolkit Solution Accelerator
' //
' // File:      MDTDataModify.vbs
' // 
' // Version:   1.0.2 (based on ZTIDataAccess.vbs v.6.2.5019.0)
' // 
' // Purpose:   Common Routines for Database Modification
' // 
' // Usage:     See this blog post: 
' //            http://blogs.technet.com/b/deploymentguys/archive/2015/07/01/writing-data-to-the-mdt-database-during-gather.aspx
' // 
' // Revisions:
' // 1.0.0  MDM  02/11/2015  Created initial script.
' // 1.0.1  MDM  02/11/2015  Commented out constants that appear in ZTIUtility.vbs.
' // 1.0.2  MDM  07/01/2015  Script name changed to MDTDataModify.vbs (was
' //                         ZTIDataModify.vbs) to avoid being mistakenly identified
' //                         as a script that shipped with MDT.
' // 
' // ***************************************************************************

option Explicit

' Public constants (Commented out constants that appear in ZTIUtility.vbs)

'---- CommandTypeEnum Values ----
Public Const adCmdUnknown = &H0008
Public Const adCmdText = &H0001
Public Const adCmdTable = &H0002
Public Const adCmdStoredProc = &H0004
Public Const adCmdFile = &H0100
Public Const adCmdTableDirect = &H0200

'---- ExecuteOptionEnum Values ----
Public Const adAsyncExecute = &H00000010
Public Const adAsyncFetch = &H00000020
Public Const adAsyncFetchNonBlocking = &H00000040
Public Const adExecuteNoRecords = &H00000080

'---- CursorTypeEnum Values ----
Public Const adOpenForwardOnly = 0
Public Const adOpenKeyset = 1
Public Const adOpenDynamic = 2
'Public Const adOpenStatic = 3

'---- LockTypeEnum Values ----
'Public Const adLockReadOnly = 1
Public Const adLockPessimistic = 2
'Public Const adLockOptimistic = 3
Public Const adLockBatchOptimistic = 4


'//---------------------------------------------------------------------------
'//  Function:	ModifySQL
'//  Purpose:	Query SQL Server to obtain data for a particular rule
'//---------------------------------------------------------------------------
Function ModifySQL(sSection)

    Dim oDatabase

    Dim iRetVal, iExecuteRetVal, sElement, sColumn, objTmp, bFoundColumn, bFirst
    Dim objErr
    Dim oRS


    iRetVal = Success

    ' Create a database object

    Set oDatabase = New DatabaseModify
    oDatabase.IniFile = LocateINI
    oDatabase.SectionName = sSection
    If (oDatabase.Connect is Nothing) then
        oLogging.CreateEvent 41038, LogTypeError, "Unable to establish database connection using [" & sSection & "] properties.", Array()
        ModifySQL = Failure
        Exit Function
    End if


    ' Issue the SQL statement

    iExecuteRetVal = oDatabase.ExecuteStatement
    If iExecuteRetVal = Failure then
        oLogging.CreateEvent 41039, LogTypeWarning, "Unable to execute SQL statement.", Array()
        ModifySQL = Failure
        Exit Function
    End if


    iRetVal = Success
    ModifySQL = iRetVal

End Function


'//---------------------------------------------------------------------------
'//  Function:	LocateIni
'//  Purpose:	Find the rules INI file specified or a default
'//---------------------------------------------------------------------------
Function LocateIni

    Dim sIniFile
    Dim sFoundIniFile

    oLogging.CreateEntry "Determining the INI file to use.", LogTypeInfo


    ' Get the command line values.  If not specified, they will be blank.

    If oEnvironment.Item("RulesFile") <> "" then
        sIniFile = oEnvironment.Item("RulesFile")
    Else
        sIniFile = oUtility.Arguments("inifile")
    End if


    ' Determine the INI file path and name

    If Len(sIniFile) = 0 then
        iRetVal = oUtility.FindFile("CustomSettings.ini", sIniFile)
        If iRetVal = Success then
            oLogging.CreateEntry "Using DEFAULT VALUE: Ini file = " & sIniFile, LogTypeInfo
        End if
    Else
        If not oFSO.FileExists(sIniFile) then
            iRetVal = oUtility.FindFile(sIniFile, sFoundIniFile)
            If iRetVal = Success then
                sIniFile = sFoundIniFile
            Else
                oLogging.CreateEntry "Unable to locate " & sIniFile, LogTypeInfo
                sIniFile = ""
            End if
        Else
            oLogging.CreateEntry "Using COMMAND LINE ARG: Ini file = " & sIniFile, LogTypeInfo
        End if
    End if


    oLogging.CreateEntry "Finished determining the INI file to use.", LogTypeInfo


    ' Return the located file (this will be blank of none was found)

    LocateIni = sIniFile

End Function


Class DatabaseModify

	Private sIniFile
	Private sSection
	Private dicSQLData
	Private oConn

	Private Sub Class_Initialize

		Dim sFoundIniFile
		Dim iRetVal


		' Create a dictionary object to hold the SQL info and initialize it

		Set dicSQLData = CreateObject("Scripting.Dictionary")
		dicSQLData.CompareMode = TextCompare

		dicSQLData("Order") = Array()
		dicSQLData("Parameters") = Array()

		Set oConn = Nothing

	End Sub


	Public Property Let IniFile(sIni)

		Dim sFoundIniFile
		Dim iRetVal


		' Figure out where the CustomSettings.ini file is

		sIniFile = sIni
		If Len(sIniFile) = 0 then
			iRetVal = oUtility.FindFile("CustomSettings.ini", sIniFile)
			If iRetVal <> Success then
				oLogging.CreateEntry "Unable to find CustomSettings.ini, rc = " & iRetVal, LogTypeError
				Exit Property
			End If
			oLogging.CreateEntry "Using DEFAULT VALUE: Ini file = " & sIniFile, LogTypeInfo
		Else
			If not oFSO.FileExists(sIniFile) then
				iRetVal = oUtility.FindFile(sIniFile, sFoundIniFile)
				If iRetVal = Success then
					sIniFile = sFoundIniFile
				End If
			End If
			oLogging.CreateEntry "Using specified INI file = " & sIniFile, LogTypeInfo
		End If

		If Not oFSO.FileExists(sIniFile) then
			oLogging.CreateEntry "Specified INI file does not exist (" & sIniFile & ").", LogTypeError
			Exit Property
		End If

	End Property


	Public Property Let SectionName(sSect)

		Dim iRetVal, re, sElement
		Dim arrSQLDataKeys, sTmpVal
		Dim arrParameters, arrWriteParameters

		iRetVal = Failure
		Set re = new regexp
		re.IgnoreCase = True
		re.Global = True


		' Substitute for any variables in the section name

		sSection = oEnvironment.Substitute(sSect)
		oLogging.CreateEntry "CHECKING the [" & sSection & "] section", LogTypeInfo


		' Get the "normal" values

		dicSQLData("Table") = ""
		dicSQLData("Statement") = ""
		arrSQLDataKeys = Array("SQLServer", "Instance", "Port", "Database", "Netlib", "Table", "Statement", "InsertID", "DBID", "DBPwd", "SQLShare", "ParameterCondition")
		for each sElement in arrSQLDataKeys
			sTmpVal = oUtility.ReadIni(sIniFile, sSection, sElement)
			if Len(sTmpVal) = 0 then
				oLogging.CreateEntry sElement & " key not defined in the section [" & sSection & "]", LogTypeInfo
			else
				dicSQLData(sElement) = oEnvironment.Substitute(sTmpVal)
				if Instr(UCase(sElement),"PWD") > 0 then
					oLogging.CreateEntry "Using from [" & sSection & "]: " & sElement & " = ********", LogTypeInfo
				else
					oLogging.CreateEntry "Using from [" & sSection & "]: " & sElement & " = " & sTmpVal, LogTypeInfo
				end if
			end if
		next


		' Handle "WriteParameters" differently

		sTmpVal = oUtility.ReadIni(sIniFile, sSection, "WriteParameters")
		If Len(sTmpVal) = 0 then
			oLogging.CreateEntry "No WriteParameters to include in the SQL call were specified", LogTypeInfo
			arrWriteParameters = Array()
		Else
            oLogging.CreateEntry "Using from [" & sSection & "]: WriteParameters = " & sTmpVal, LogTypeInfo
			arrWriteParameters = Split(sTmpVal, ",")
		End If
		dicSQLData("WriteParameters") = arrWriteParameters


		' Handle "Parameters" differently

		sTmpVal = oUtility.ReadIni(sIniFile, sSection, "Parameters")
		If Len(sTmpVal) = 0 then
			oLogging.CreateEntry "No parameters to include in the SQL call were specified", LogTypeInfo
			arrParameters = Array()
		Else
            oLogging.CreateEntry "Using from [" & sSection & "]: Parameters = " & sTmpVal, LogTypeInfo
			arrParameters = Split(sTmpVal, ",")
		End If
		dicSQLData("Parameters") = arrParameters


		' Make sure required values were specified

		If Len(dicSQLData("SQLServer")) = 0 then
			oLogging.CreateEntry "ERROR - SQLServer NOT defined in the section [" & sSection & "]", LogTypeError
			Exit Property
		End If

		If Len(dicSQLData("Database")) = 0 then
			oLogging.CreateEntry "Database not defined in the section [" & sSection & "]. Using default (BDDAdminDB).", LogTypeInfo
			dicSQLData("Database") = "BDDAdminDB"
		End If
		If Len(dicSQLData("Table")) = 0 then
			oLogging.CreateEntry "Warning - Table not defined in the section [" & sSection & "]. Using default Table = BDDAdminCore", LogTypeWarning
			dicSQLData("Table") = "BDDAdminCore"
		End If
		If Len(dicSQLData("Netlib")) = 0 then
			oLogging.CreateEntry "Default Netlib of DBNMPNTW (named pipes) will be used for connecting to SQL Server.", LogTypeInfo
			dicSQLData("Netlib") = "DBNMPNTW"
		End If
		If Len(dicSQLData("ParameterCondition")) = 0 then
			oLogging.CreateEntry "Default ParameterCondition 'AND' will be used for building queries with multiple parameters.", LogTypeInfo
			dicSQLData("ParameterCondition") = "AND"
		End If
		If Len(dicSQLData("SQLShare")) = 0 and UCase(dicSQLData("Netlib")) = "DBNMPNTW" then
			oLogging.CreateEntry "SQLShare NOT defined in the section [" & sSection & "], trusted connection may fail if there is not already a connection to the SQL Server.", LogTypeInfo
		End If


		' Was an instance name specified with the SQLServer name?  If so, split them apart

		If Instr(dicSQLData("SQLServer"), "\") > 0 then
			dicSQLData("Instance") = Mid(dicSQLData("SQLServer"), Instr(dicSQLData("SQLServer"), "\") + 1)
			dicSQLData("SQLServer") = Left(dicSQLData("SQLServer"), Instr(dicSQLData("SQLServer"), "\") - 1)
		End If

	End Property


	' SQLServer property

	Public Property Get SQLServer
		If dicSQLData.Exists("SQLServer") then
			SQLServer = dicSQLData("SQLServer")
		Else
			SQLServer = ""
		End if
	End Property

	Public Property Let SQLServer(sSQLServer)
		dicSQLData("SQLServer") = sSQLServer
	End Property


	' Instace property

	Public Property Get Instance
		If dicSQLData.Exists("Instance") then
			Instance = dicSQLData("Instance")
		Else
			Instance = ""
		End if
	End Property

	Public Property Let Instance(sInstance)
		dicSQLData("Instance") = sInstance
	End Property


	' Port property

	Public Property Get Port
		If dicSQLData.Exists("Port") then
			Port = dicSQLData("Port")
		Else
			Port = ""
		End if
	End Property

	Public Property Let Port(sPort)
		dicSQLData("Port") = sPort
	End Property


	' Database property

	Public Property Get Database
		If dicSQLData.Exists("Database") then
			Database = dicSQLData("Database")
		Else
			Database = ""
		End if
	End Property

	Public Property Let Database(sDatabase)
		dicSQLData("Database") = sDatabase
	End Property


	' Netlib property

	Public Property Get Netlib
		If dicSQLData.Exists("Netlib") then
			Netlib = dicSQLData("Netlib")
		Else
			Netlib = ""
		End if
	End Property

	Public Property Let Netlib(sNetlib)
		dicSQLData("Netlib") = sNetlib
	End Property


	' Table property

	Public Property Get Table
		If dicSQLData.Exists("Table") then
			Table = dicSQLData("Table")
		Else
			Table = ""
		End if
	End Property

	Public Property Let Table(sTable)
		dicSQLData("Table") = sTable
	End Property


	' DBID property

	Public Property Get DBID
		If dicSQLData.Exists("DBID") then
			DBID = dicSQLData("DBID")
		Else
			DBID = ""
		End if
	End Property

	Public Property Let DBID(sDBID)
		dicSQLData("DBID") = sDBID
	End Property


	' DBPwd property

	Public Property Get DBPwd
		If dicSQLData.Exists("DBPwd") then
			DBPwd = dicSQLData("DBPwd")
		Else
			DBPwd = ""
		End if
	End Property

	Public Property Let DBPwd(sDBPwd)
		dicSQLData("DBPwd") = sDBPwd
	End Property


	' SQLShare property

	Public Property Get SQLShare
		If dicSQLData.Exists("SQLShare") then
			SQLShare = dicSQLData("SQLShare")
		Else
			SQLShare = ""
		End if
	End Property

	Public Property Let SQLShare(sSQLShare)
		dicSQLData("SQLShare") = sSQLShare
	End Property


	' ParameterCondition property

	Public Property Get ParameterCondition
		If dicSQLData.Exists("ParameterCondition") then
			ParameterCondition = dicSQLData("ParameterCondition")
		Else
			ParameterCondition = ""
		End if
	End Property

	Public Property Let ParameterCondition(sParameterCondition)
		dicSQLData("ParameterCondition") = sParameterCondition
	End Property


	' Parameters property

	Public Property Get Parameters
		If dicSQLData.Exists("Parameters") then
			Parameters = Join(dicSQLData("Parameters"), ",")
		Else
			Parameters = ""
		End if
	End Property

	Public Property Let Parameters(sParameters)
		If sParameters = "" then
			dicSQLData("Parameters") = Array()
		Else
			dicSQLData("Parameters") = Split(sParameters, ",")
		End if
	End Property


	' WriteParameters property

	Public Property Get WriteParameters
		If dicSQLData.Exists("WriteParameters") then
			WriteParameters = Join(dicSQLData("WriteParameters"), ",")
		Else
			WriteParameters = ""
		End if
	End Property

	Public Property Let WriteParameters(sWriteParameters)
		If sWriteParameters = "" then
			dicSQLData("WriteParameters") = Array()
		Else
			dicSQLData("WriteParameters") = Split(sWriteParameters, ",")
		End if
	End Property


	Public Function Connect

		Dim sDSNRef
		Dim sMsg


		' Create a new ADO connection object

		On Error Resume Next
		Set oConn = CreateObject("ADODB.Connection")
		If Err then
			oLogging.CreateEntry "ERROR - Unable to create ADODB.Connection object, impossible to connect to SQL Server: " & Err.Description & " (" & Err.Number & ")", LogTypeError
			Set Connect = Nothing
			Exit Function
		End If
		On Error Goto 0


		' If a SQLShare value is specified, try to establish a connection

		If Len(dicSQLData("DBID")) = 0 or Len(dicSQLData("DBPwd")) = 0 then
			If Len(dicSQLData("SQLShare")) > 0 then
				oUtility.ValidateConnection "\\" & dicSQLData("SQLServer") & "\" & dicSQLData("SQLShare")
			Else
				oLogging.CreateEntry "No SQLShare value was specified, not possible to establish a secure connection.", LogTypeInfo
			End If
		End If


		' Build the connect string

		sDSNRef = "Provider=SQLOLEDB;OLE DB Services=0;Data Source=" & dicSQLData("SQLServer")

		If Len(dicSQLData("Instance")) > 0 then
			sDSNRef = sDSNRef & "\" & dicSQLData("Instance")
		End If
		If Len(dicSQLData("Port")) > 0 then
			sDSNRef = sDSNRef & "," & dicSQLData("Port")
		End If

		sDSNRef = sDSNRef & ";Initial Catalog=" & dicSQLData("Database") & ";Network Library=" & dicSQLData("Netlib")

		If len(dicSQLData("DBID")) = 0 OR len(dicSQLData("DBPwd")) = 0 then
			oLogging.CreateEntry "OPENING TRUSTED SQL CONNECTION to server " & dicSQLData("SQLServer") & ".", LogTypeInfo
			sDSNRef = sDSNRef & ";Integrated Security=SSPI"
		Else
			oLogging.CreateEntry "OPENING STANDARD SECURITY SQL CONNECTION to server " & dicSQLData("SQLServer") & " using login " & dicSQLData("DBID") & ".", LogTypeInfo
			sDSNRef = sDSNRef & ";User ID=" & dicSQLData("DBID") & ";Password=" & dicSQLData("DBPwd")
		End If


		' Connect to the database

		oLogging.CreateEntry "Connecting to SQL Server using connect string: " & sDSNref, LogTypeInfo
		On Error Resume Next
		oConn.Open sDSNref
		If Err then
			sMsg = Err.Description & " (" & Err.Number & ")"

			CreateEvent 41013, LogTypeError, "ZTI error opening SQL connection: " & sMsg

			iRetVal = Failure
			oLogging.CreateEntry "ZTI error opening SQL Connection: " & sMsg, LogTypeError
			For each objErr in oConn.Errors
				oLogging.CreateEntry "  ADO error: " & objErr.Description & " (Error #" & objErr.Number & "; Source: " & objErr.Source & "; SQL State: " & objErr.SQLState & "; NativeError: " & objErr.NativeError & ")", LogTypeError
			Next
			Err.Clear
			Set Connect = Nothing
			Exit Function
		End If
		On Error Goto 0

		oLogging.CreateEntry "Successfully opened connection to database.", LogTypeInfo


		' Return the connection to the caller

		Set Connect = oConn

	End Function


	Public Property Get Connection

		Set Connection = oConn

	End Property


	Public Function ExecuteStatement

		Dim bFoundColumn, bValueFound, bFirst, bClauseFirst, bAddWhereClause
		Dim nRecordsAffected
		Dim oRS, objTmp, objErr
		Dim sStatement, sSQL, sErrMsg, sSelect, sElement, sColumn, sMsg, sColumnList, sValueList, sID
		Dim tmpList, tmpValue, tmpArray, tmpClause
		Dim v

		ExecuteStatement = Failure


		' Build the SQL statement

        bAddWhereClause = False

        sStatement = UCase(dicSQLData("Statement"))
        sSQL = sStatement
        Select Case sStatement

            Case "UPDATE"

                bAddWhereClause = True
                sSQL = sSQL & " " & dicSQLData("Table") & " SET "


                ' Build column = 'value' pairs

                bFirst = True
                For each sElement in dicSQLData("WriteParameters")

                    sElement = UCase(trim(sElement))

                    ' Find the column ID to use

                    sColumn = TranslateToColumnID(sElement)


                    ' Find the value to work with

                    bValueFound = False
                    If oEnvironment.ListItem(sElement).Count > 0 then

                        ' If a list item, select first value

                        Set tmpList = oEnvironment.ListItem(sElement)
                        For each v in tmpList.Keys
                            If v <> "" then
                                tmpValue = v
                                bValueFound = true
                                Exit For
                            End If
                        Next

                    ElseIf oEnvironment.Item(sElement) <> "" then
                        tmpValue = oEnvironment.Item(sElement)
                        bValueFound = true
                    Else
                        tmpValue = ""
                    End If

                    If bValueFound then

                        If bFirst then
                            sSQL = sSQL & sColumn & " = '" & tmpValue & "'"
                            bFirst = False
                        Else
                            sSQL = sSQL & ", " & sColumn & " = '" & tmpValue & "'"
                        End If

                    End If

                Next

            Case "INSERT"

                sSQL = sSQL & " INTO " & dicSQLData("Table") & " "


                ' Build column & value lists

                bFirst = True
                For each sElement in dicSQLData("WriteParameters")

                    sElement = UCase(trim(sElement))

                    ' Find the column ID to use

                    sColumn = TranslateToColumnID(sElement)


                    ' Find the value to work with

                    bValueFound = False
                    If oEnvironment.ListItem(sElement).Count > 0 then

                        ' If a list item, select first value

                        Set tmpList = oEnvironment.ListItem(sElement)
                        For each v in tmpList.Keys
                            If v <> "" then
                                tmpValue = v
                                bValueFound = true
                                Exit For
                            End If
                        Next

                    ElseIf oEnvironment.Item(sElement) <> "" then
                        tmpValue = oEnvironment.Item(sElement)
                        bValueFound = true
                    Else
                        tmpValue = ""
                    End If

                    If bValueFound then

                        If bFirst then
                            sColumnList = sColumn
                            sValueList = "'" & tmpValue & "'"
                            bFirst = False
                        Else
                            sColumnList = sColumnList & ", " & sColumn
                            sValueList = sValueList & ", " & "'" & tmpValue & "'"
                        End If

                    End If

                Next

                sSQL = sSQL & "(" & sColumnList & ") VALUES (" & sValueList & ") SELECT @@IDENTITY AS InsertID"

            Case "DELETE"

                bAddWhereClause = True
                sSQL = sSQL & " FROM " & dicSQLData("Table")

            Case Else

                oLogging.CreateEntry "ERROR - Unsupported statement type: " & sStatement, LogTypeError

        End Select


		If bAddWhereClause then


			sSQL = sSQL & " WHERE "
			bFirst = True
			For each sElement in dicSQLData("Parameters")

				sElement = UCase(trim(sElement))

				' Find the column ID to use

				sColumn = TranslateToColumnID(sElement)


				' Find the value to work with

				bValueFound = False
				If oEnvironment.ListItem(sElement).Count > 0 then
					Set tmpValue = oEnvironment.ListItem(sElement)
					For each v in tmpValue.Keys
						If v <> "" then
							bValueFound = true
							Exit For
						End If
					Next
				ElseIf oEnvironment.Item(sElement) <> "" then
					tmpValue = oEnvironment.Item(sElement)
					bValueFound = true
				Else
					tmpValue = ""
				End If

				If bValueFound then

					' Check if an AND/OR is needed

					If not bFirst then
						sSQL = sSQL & " " & dicSQLData("ParameterCondition") & " "
					Else
						bFirst = False
					End If


					' Handle it appropriately

					If IsObject(tmpValue) then  ' It must be a dictionary object
						tmpClause = sColumn & " IN ("
						bClauseFirst = True
						For each v in tmpValue.Keys
							If not bClauseFirst then
								tmpClause = tmpClause & ","
							Else
								bClauseFirst = False
							End If
							tmpClause = tmpClause & "'" & v & "'"
						Next
						sSQL = sSQL & tmpClause & ")"
					Else
						sSQL = sSQL & sColumn & " = '" & tmpValue & "'"

					End If

				End If

			Next

			If bFirst then

				oLogging.CreateEntry "No parameters had non-blank values, adding dummy query clause to force no records.", LogTypeInfo
				sSQL = sSQL & "0=1"

			End If


		End If


		' Issue the SQL statement

		oLogging.CreateEntry "About to issue SQL statement: " & sSQL, LogTypeInfo
		On Error Resume Next

        If (sStatement = "INSERT") And (Len(dicSQLData("InsertID")) > 0) Then

            'http://www.kamath.com/tutorials/tut007_identity.asp
            ' Execute the SQL statement
            Set oRS = oConn.Execute(sSQL, nRecordsAffected, adCmdText)

            ' Get the second resultset (SELECT) into a RecordSet object
            Set oRS = oRS.NextRecordSet()

            ' Set InsertID to variable if specified
            oEnvironment.Item(dicSQLData("InsertID")) = oEnvironment.Substitute(oRS.Fields("InsertID").value)

        Else
            oConn.Execute sSQL, nRecordsAffected, adCmdText + adExecuteNoRecords
        End If

		If Err then
			oLogging.CreateEntry "ERROR - Executing SQL statement (Error Number = " & Err.Number & ") (Error Description: " & Err.Description & ").", LogTypeError
			For each objErr in oConn.Errors
				oLogging.CreateEntry "  ADO error: " & objErr.Description & " (Error #" & objErr.Number & "; Source: " & objErr.Source & "; SQL State: " & objErr.SQLState & "; NativeError: " & objErr.NativeError & ")", LogTypeError
			Next
			'oRS.Close
			Err.Clear
            ExecuteStatement = Failure
			Exit Function
		Else
            oLogging.CreateEntry "Operation Completed.  Number of records affected: " & nRecordsAffected, LogTypeInfo
            oLogging.CreateEntry "(Number of records affected may not be correct if record(s) affected by a trigger.)", LogTypeInfo
            ExecuteStatement = Success
		End If

		On Error Goto 0

		oLogging.CreateEntry "Successfully modified the database.", LogTypeInfo

	End Function


	Public Function TranslateToColumnID(sElement)

		Dim sColumn

		sColumn = oUtility.ReadIni(sIniFile, sSection, sElement)
		If sColumn = "" then
			sColumn = sElement
		End If

		TranslateToColumnID = sColumn

	End Function

End Class

