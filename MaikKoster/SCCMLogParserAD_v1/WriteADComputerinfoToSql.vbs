' // ***************************************************************************
' // 
' // Copyright (c) Maik Koster.  All rights reserved.
' //
' // File:      WriteADComputerinfoToSql.vbs
' // 
' // Version:   1
' // 
' // Purpose:   Uses Logparser to read computer information from AD
' //            and upload it to a SQL Table
' // 
' // Usage:     cscript.exe [//nologo] WriteADComputerinfoToSql.vbs
' // 
' // History:   
' //    1 MK  28.09.2012  Initial script 
' //
' // Download: http://mdtcustomizations.codeplex.com/releases/view/37245
' //  
' //
' // Disclaimer: This script is provided "AS IS" without express 
' //             or implied warranty of any kind.
' // 
' // ***************************************************************************

Option Explicit


' // ***************************************************************************
' //
' // Variable Declaration
' //
' // ***************************************************************************
Dim oLogQuery
Dim oADInputFormat
Dim oSQLOutputFormat 
Dim strLDAP
Dim strQuery
Dim strSQLServer
Dim strDatabase
Dim strTable 


' // ***************************************************************************
' //
' // Configure the following variables to adjust script behavior to your environment
' //
' // ***************************************************************************
strLDAP = "LDAP://yourdomain.com"
strSQLServer = "YourSQLServer"
strDatabase = "TempDB"
strTable = "tmp_ADComputers"



' // ***************************************************************************
' // Don't change anything after this line !!!
' // ***************************************************************************

' Create LogParser object
Set oLogQuery = CreateObject("MSUtil.LogQuery") 


' Create Input Format object
Set oADInputFormat = CreateObject("MSUtil.LogQuery.ADSInputFormat") 

oADInputFormat.objClass = "Computer"


' Create Output Format object
Set oSQLOutputFormat = CreateObject("MSUtil.LogQuery.SQLOutputFormat")

With oSQLOutputFormat
    .createTable = True
    .clearTable = True
    .database=strDatabase
    .server=strSQLServer
End With 

' Create query text
strQuery = "SELECT cn, objectpath, operatingSystem, operatingSystemServicePack"
strQuery = strQuery & ", CASE LastLogonTimestamp WHEN 0 THEN NULL ELSE "
strQuery = strQuery & " TO_TIMESTAMP(ADD(DIV(TO_REAL(LastLogonTimestamp), 10000000.0), TO_REAL(TIMESTAMP('1601','yyyy')))) END AS [LastLogon]"
strQuery = strQuery & ", CASE pwdLastSet WHEN 0 THEN NULL ELSE "
strQuery = strQuery & " TO_TIMESTAMP(ADD(DIV(TO_REAL(pwdLastSet), 10000000.0), TO_REAL(TIMESTAMP('1601','yyyy')))) END AS [PwdLastSet]"
strQuery = strQuery & " INTO " & strTable & " FROM" 
strQuery = strQuery & "'" & strLDAP & "'" 


' Execute query
oLogQuery.ExecuteBatch strQuery, oADInputFormat, oSQLOutputFormat 


' Cleanup
Set oLogQuery = nothing
Set oADInputFormat = nothing
Set oSQLOutputFormat = nothing