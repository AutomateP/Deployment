' //***************************************************************************
' // ***** Script Header *****
' //
' // Solution:  Custom Script for use with the Microsoft Deployment Toolkit
' // File:      ModelAliasExit.vbs
' //
' // Purpose:   User exit script to set ModelAlias from WMI information.
' //            
' // Usage:     Modify CustomSettings.ini similar to this:
' //              [Settings]
' //              Priority=SetModelAlias, MMApplications, Default 
' //              Properties=MyCustomProperty, ModelAlias
' // 
' //              [SetModelAlias]
' //              UserExit=ModelAliasExit.vbs
' //              ModelAlias=#SetModelAlias()#
' //
' //              [MMApplications] 
' //              SQLServer=DBServer 
' //              Database=MDTDB 
' //              Netlib=DBNMPNTW 
' //              SQLShare=Logs 
' //              Table=MakeModelApplications 
' //              Parameters=Make, ModelAlias 
' //              ModelAlias=Model 
' //              Order=Sequence
' //
' // Version:   1.0.4
' // 
' // History:
' // 1.0.0   MDM   08/13/2009   Created script.
' // 1.0.1   MDM   08/27/2009   Added SetModelAlias = sModel case for nearly
' //                            all Make sections of SetModelAlias.
' // 1.0.2   MDM   10/07/2009   Changed logic for Panasonic Toughbook models.
' // 1.0.3   MDM   12/11/2009   Added model and changed model strings for Hyper-V.
' // 1.0.4   MDM   05/01/2012   Added model and changed model strings for Hyper-V, Xen, IBM, Lennovo, HP and then some
' //
' // ***** End Header *****

Function UserExit(sType, sWhen, sDetail, bSkip)

    oLogging.CreateEntry "USEREXIT:ModelAliasExit.vbs started: " & sType & " " & sWhen & " " & sDetail, LogTypeInfo

    UserExit = Success

End Function


Function SetModelAlias()

    oLogging.CreateEntry "------------ Initialization USEREXIT:ModelAliasExit.vbs|SetModelAlias -------------", LogTypeInfo

    sMake = oEnvironment.Item("Make")
    sModel = oEnvironment.Item("Model")
    SetModelAlias = ""
    sCSPVersion = ""
    sBIOSVersion = ""

    Set colComputerSystemProduct = objWMI.ExecQuery("SELECT * FROM Win32_ComputerSystemProduct")
    If Err then
        oLogging.CreateEntry "Error querying Win32_ComputerSystemProduct: " & Err.Description & " (" & Err.Number & ")", LogTypeError
    Else
        For Each objComputerSystemProduct in colComputerSystemProduct
            If not IsNull(objComputerSystemProduct.Version) then
                sCSPVersion = Trim(objComputerSystemProduct.Version)
                oLogging.CreateEntry "USEREXIT:ModelAliasExit.vbs|SetModelAlias - Win32_ComputerSystemProduct Version: " & sCSPVersion, LogTypeInfo
            End If
        Next
    End if

    Set colBIOS = objWMI.ExecQuery("SELECT * FROM Win32_BIOS")
    If Err then
        oLogging.CreateEntry "Error querying Win32_BIOS: " & Err.Description & " (" & Err.Number & ")", LogTypeError
    Else
        For Each objBIOS in colBIOS
            If not IsNull(objBIOS.Version) then
                sBIOSVersion = Trim(objBIOS.Version)
                oLogging.CreateEntry "USEREXIT:ModelAliasExit.vbs|SetModelAlias - Win32_BIOS Version: " & sBIOSVersion, LogTypeInfo
            End If
        Next
    End if


    ' Check by Make
    
    Select Case sMake

        Case "Dell Computer Corporation", "Dell Inc.", "Dell Computer Corp."

            ' Use Model with spaces removed
            
            ' SetModelAlias = Replace(sModel, " ", "")

	    SetModelAlias = sModel	

        Case "Hewlett-Packard"

            ' Use Model with spaces removed
            
            ' SetModelAlias = Replace(sModel, " ", "")

	    Select Case sModel
		Case "HP Compaq nw8240 (PY442EA#AK8)"
		    SetModelAlias = "HP Compaq nw8240"
                Case Else
                    SetModelAlias = sModel 
                    oLogging.CreateEntry "USEREXIT:ModelAliasExit.vbs|SetModelAlias - Alias rule not found.  ModelAlias set to Model value." , LogTypeInfo
            End Select

        Case "HP"

            ' Use Model with spaces removed
            
            ' SetModelAlias = Replace(sModel, " ", "")

            SetModelAlias = sModel

        Case "IBM"

            ' Use Model with spaces removed
            
            ' SetModelAlias = Replace(sModel, " ", "")

	    Select Case sModel
		Case "---[HS22]---"
		    SetModelAlias = "IBMHS22"
                Case Else
                    SetModelAlias = sModel 
                    oLogging.CreateEntry "USEREXIT:ModelAliasExit.vbs|SetModelAlias - Alias rule not found.  ModelAlias set to Model value." , LogTypeInfo
            End Select

        Case "LENOVO"

            ' Check by Version property of the Win32_ComputerSystemProduct WMI class first
            
            If Not sCSPVersion = "" Then
            
                Select Case sCSPVersion
                    Case "ThinkPad T61p"
                        SetModelAlias = "ThinkPad T61"
                    Case Else
                    ' Use Version with spaces removed
                    ' SetModelAlias = Replace(sCSPVersion, " ", "")
                    SetModelAlias = sModel
                End Select
            
            End If


            ' Check by first 4 characters of the Model

            If SetModelAlias = "" Then 
            
                sModelSubString = Left(sModel,4)
                
                Select Case sModelSubString
                    Case "1706"
                        SetModelAlias = "ThinkPad X60"
                    Case Else
                        SetModelAlias = sModel
                        oLogging.CreateEntry "USEREXIT:ModelAliasExit.vbs|SetModelAlias - Alias rule not found.  ModelAlias set to Model value." , LogTypeInfo
                End Select

            End If


        Case "Matsushita Electric Industrial Co.,Ltd."

            'Panasonic Toughbook models
            
            If Left(sModel,2) = "CF" Then 
                SetModelAlias = Left(sModel,5)
            Else
                SetModelAlias = sModel 
                oLogging.CreateEntry "USEREXIT:ModelAliasExit.vbs|SetModelAlias - Alias rule not found.  ModelAlias set to Model value." , LogTypeInfo
            End If


        Case "Microsoft Corporation"

            Select Case sBIOSVersion
                Case "VRTUAL - 1000831"
                    SetModelAlias = "Hyper-V2008BetaorRC0"
                Case "VRTUAL - 5000805", "BIOS Date: 05/05/08 20:35:56  Ver: 08.00.02"
                    SetModelAlias = "Hyper-V2008RTM"
                Case "VRTUAL - 3000919" 
                    SetModelAlias = "Hyper-V2008R2"
                Case "VRTUAL - 9001114" 
                    SetModelAlias = "Hyper-V2012BETA"
                Case "A M I  - 2000622"
                    SetModelAlias = "VS2005R2SP1orVPC2007"
                Case "A M I  - 9000520"
                    SetModelAlias = "VS2005R2"
                Case "A M I  - 9000816", "A M I  - 6000901"
                    SetModelAlias = "WindowsVirtualPC"
                Case "A M I  - 8000314"
                    SetModelAlias = "VS2005orVPC2004"
                Case Else
                    SetModelAlias = sModel 
                    oLogging.CreateEntry "USEREXIT:ModelAliasExit.vbs|SetModelAlias - Alias rule not found.  ModelAlias set to Model value." , LogTypeInfo
            End Select

        Case "Xen"

            Select Case sCSPVersion
                Case "4.1.2"
                    SetModelAlias = "XenServer602"
                Case Else
                    SetModelAlias = "XenServer" 
                    oLogging.CreateEntry "USEREXIT:ModelAliasExit.vbs|SetModelAlias - Alias rule not found.  ModelAlias set to Model value." , LogTypeInfo
            End Select

        Case "VMware, Inc."

            SetModelAlias = "VMware"


        Case Else
            
            If Instr(sModel, "(") > 2 Then 
                SetModelAlias = Trim(Left(sModel, Instr(sModel, "(") - 2)) 
            Else 
                SetModelAlias = sModel 
                oLogging.CreateEntry "USEREXIT:ModelAliasExit.vbs|SetModelAlias - Alias rule not found.  ModelAlias set to Model value." , LogTypeInfo
            End if 


    End Select


    oLogging.CreateEntry "USEREXIT:ModelAliasExit.vbs|SetModelAlias - ModelAlias has been set to " & SetModelAlias, LogTypeInfo

    oLogging.CreateEntry "------------ Departing USEREXIT:ModelAliasExit.vbs|SetModelAlias -------------", LogTypeInfo

End Function

