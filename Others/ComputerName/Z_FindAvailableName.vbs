StrAvailableName = FindAvailableName("TestWS")

Function FindAvailableName(StrPrefix)
    '*****************************************
    '* Search for an available computer name *
    '*****************************************
    Const ADS_SCOPE_SUBTREE = 2
    Dim nCount, PCName,PCExist
    Dim objConnection, objCommand,objRecordSet,PCVar

    nCount = 1
    PCName = StrPrefix & "0" & nCount
    PCExist = False

    Do Until PCExist 
        Set objConnection = CreateObject("ADODB.Connection")
        Set objCommand = CreateObject("ADODB.Command")
        objConnection.Provider = "ADsDSOObject"
        objConnection.Open "Active Directory Provider"
        Set objCommand.ActiveConnection = objConnection

        objCommand.Properties("Page Size") = 1000
        objCommand.Properties("Searchscope") = ADS_SCOPE_SUBTREE 

        'Enter your LDAP search root for your domain here 'LDAP://dc=corp,dc=com'
        objCommand.CommandText = "SELECT ADsPath FROM 'LDAP://dc=test-dc,dc=test,dc=local' WHERE objectCategory='computer' " & "AND name=' " & PCName & "'"
        Set objRecordSet = objCommand.Execute

        PCVar = ""
        if not (objRecordSet.EOF And objRecordSet.BOF) Then 
            objRecordSet.MoveFirst
            Do Until objRecordSet.EOF
                WScript.Echo objRecordSet.Fields("ADsPath").Value
                PCVar = objRecordSet.Fields("ADsPath").Value
                objRecordSet.MoveNext
            Loop
            nCount = nCount + 1
            if nCount < 10 then
                PCName = StrPrefix & "0" & nCount
            else 
                PCName = StrPrefix & nCount
            End If

            IF PCVar = "" Then
                PCExist = True
            END IF

        End If 

    Loop

    AvailablePCName = PCName

End Function