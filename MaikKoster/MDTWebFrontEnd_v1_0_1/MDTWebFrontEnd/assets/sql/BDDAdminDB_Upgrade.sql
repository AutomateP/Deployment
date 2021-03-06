
/* ------------------------------------------------------------------------ */
/* Initialization                                                           */
/* ------------------------------------------------------------------------ */

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS OFF 
GO


/* ------------------------------------------------------------------------ */
/* Add new columns if they are not already present                          */
/* ------------------------------------------------------------------------ */

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'SkipTaskSequence')
ALTER TABLE [dbo].[Settings] ADD [SkipTaskSequence] [nvarchar] (50) NULL Default ('')
GO
if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'SkipDestinationDisk')
ALTER TABLE [dbo].[Settings] ADD [SkipDestinationDisk] [nvarchar] (50) NULL Default ('')
GO
if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'SLShareDynamicLogging')
ALTER TABLE [dbo].[Settings] ADD [SLShareDynamicLogging] [nvarchar] (255) NULL Default ('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDComputerName')
ALTER TABLE [dbo].[Settings] ADD [OSDComputerName] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'TaskSequenceID')
ALTER TABLE [dbo].[Settings] ADD [TaskSequenceID] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'SystemLocale')
ALTER TABLE [dbo].[Settings] ADD [SystemLocale] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDBitlockerMode')
ALTER TABLE [dbo].[Settings] ADD [OSDBitlockerMode] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'BdeInstallSuppress')
ALTER TABLE [dbo].[Settings] ADD [BdeInstallSuppress] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDBitLockerStartupKeyDrive')
ALTER TABLE [dbo].[Settings] ADD [OSDBitLockerStartupKeyDrive] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDBitLockerCreateRecoveryPassword')
ALTER TABLE [dbo].[Settings] ADD [OSDBitLockerCreateRecoveryPassword] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDBitLockerWaitForEncryption')
ALTER TABLE [dbo].[Settings] ADD [OSDBitLockerWaitForEncryption] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'BDEWaitForEncryption')
ALTER TABLE [dbo].[Settings] ADD [BDEWaitForEncryption] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDBitLockerRecoveryPassword')
ALTER TABLE [dbo].[Settings] ADD [OSDBitLockerRecoveryPassword] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDBitLockerStartupKey')
ALTER TABLE [dbo].[Settings] ADD [OSDBitLockerStartupKey] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'FinishAction')
ALTER TABLE [dbo].[Settings] ADD [FinishAction] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'SMSTSRunCommandLineUserName')
ALTER TABLE [dbo].[Settings] ADD [SMSTSRunCommandLineUserName] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'SMSTSRunCommandLineUserPassword')
ALTER TABLE [dbo].[Settings] ADD [SMSTSRunCommandLineUserPassword] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'USMTConfigFile')
ALTER TABLE [dbo].[Settings] ADD [USMTConfigFile] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'WipeDisk')
ALTER TABLE [dbo].[Settings] ADD [WipeDisk] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = '_SMSTSORGNAME')
ALTER TABLE [dbo].[Settings] ADD [_SMSTSORGNAME] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'WsusServer')
ALTER TABLE [dbo].[Settings] ADD [WsusServer] [nvarchar] (255) NULL Default('')
GO
	
if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'USMT3')
ALTER TABLE [dbo].[Settings] ADD [USMT3] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DriverSelectionProfile')
ALTER TABLE [dbo].[Settings] ADD [DriverSelectionProfile] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'PackageSelectionProfile')
ALTER TABLE [dbo].[Settings] ADD [PackageSelectionProfile] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'WizardSelectionProfile')
ALTER TABLE [dbo].[Settings] ADD [WizardSelectionProfile] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'AutoMode')
ALTER TABLE [dbo].[Settings] ADD [AutoMode] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'AutoUsers')
ALTER TABLE [dbo].[Settings] ADD [AutoUsers] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'ApplicationSuccessCodes')
ALTER TABLE [dbo].[Settings] ADD [ApplicationSuccessCodes] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'BackupFile')
ALTER TABLE [dbo].[Settings] ADD [BackupFile] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DestinationDisk')
ALTER TABLE [dbo].[Settings] ADD [DestinationDisk] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DestinationPartition')
ALTER TABLE [dbo].[Settings] ADD [DestinationPartition] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapterCount')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapterCount] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0Name')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0Name] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0MacAddress')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0MacAddress] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0EnableDHCP')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0EnableDHCP] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0IPAddressList')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0IPAddressList] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0SubnetMask')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0SubnetMask] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0Gateways')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0Gateways] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0Gateways')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0Gateways] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0GatewayCostMetric')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0GatewayCostMetric] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0DNSServerList')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0DNSServerList] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0DNSSuffix')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0DNSSuffix] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0EnableDNSRegistration')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0EnableDNSRegistration] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0EnableFullDNSRegistration')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0EnableFullDNSRegistration] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0EnableLMHOSTS')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0EnableLMHOSTS] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0EnableWINS')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0EnableWINS] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0TcpipNetbiosOptions')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0TcpipNetbiosOptions] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0WINSServerList')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0WINSServerList] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0EnableTCPIPFiltering')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0EnableTCPIPFiltering] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0TCPFilterPortList')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0TCPFilterPortList] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0UDPFilterPortList')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0UDPFilterPortList] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDAdapter0IPProtocolFilterList')
ALTER TABLE [dbo].[Settings] ADD [OSDAdapter0IPProtocolFilterList] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDDiskIndex')
ALTER TABLE [dbo].[Settings] ADD [OSDDiskIndex] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions0TYPE')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions0TYPE] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions0FILESYSTEM')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions0FILESYSTEM] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions0BOOTABLE')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions0BOOTABLE] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions0QUICKFORMAT')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions0QUICKFORMAT] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions0VOLUMENAME')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions0VOLUMENAME] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions0SIZE')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions0SIZE] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions0SIZEUNITS')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions0SIZEUNITS] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions0VOLUMELETTERVARIABLE')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions0VOLUMELETTERVARIABLE] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions1TYPE')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions1TYPE] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions1FILESYSTEM')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions1FILESYSTEM] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions1BOOTABLE')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions1BOOTABLE] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions1QUICKFORMAT')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions1QUICKFORMAT] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions1VOLUMENAME')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions1VOLUMENAME] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions1SIZE')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions1SIZE] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSDPartitions1SIZEUNITS')
ALTER TABLE [dbo].[Settings] ADD [OSDPartitions1SIZEUNITS] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DoNotCreateExtraPartition')
ALTER TABLE [dbo].[Settings] ADD [DoNotCreateExtraPartition] [nvarchar] (50) NULL Default('')
GO


if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSRoles')
ALTER TABLE [dbo].[Settings] ADD [OSRoles] [nvarchar] (MAX) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSRoleServices')
ALTER TABLE [dbo].[Settings] ADD [OSRoleServices] [nvarchar] (MAX) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'OSFeatures')
ALTER TABLE [dbo].[Settings] ADD [OSFeatures] [nvarchar] (MAX) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'ReplicaOrNewDomain')
ALTER TABLE [dbo].[Settings] ADD [ReplicaOrNewDomain] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'NewDomain')
ALTER TABLE [dbo].[Settings] ADD [NewDomain] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'NewDomainDNSName')
ALTER TABLE [dbo].[Settings] ADD [NewDomainDNSName] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'ParentDomainDNSName')
ALTER TABLE [dbo].[Settings] ADD [ParentDomainDNSName] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'ReplicaDomainDNSName')
ALTER TABLE [dbo].[Settings] ADD [ReplicaDomainDNSName] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'ChildName')
ALTER TABLE [dbo].[Settings] ADD [ChildName] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DomainNetBiosName')
ALTER TABLE [dbo].[Settings] ADD [DomainNetBiosName] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'ForestLevel')
ALTER TABLE [dbo].[Settings] ADD [ForestLevel] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DomainLevel')
ALTER TABLE [dbo].[Settings] ADD [DomainLevel] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'AutoConfigDNS')
ALTER TABLE [dbo].[Settings] ADD [AutoConfigDNS] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'ConfirmGC')
ALTER TABLE [dbo].[Settings] ADD [ConfirmGC] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'CriticalReplicationOnly')
ALTER TABLE [dbo].[Settings] ADD [CriticalReplicationOnly] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'ADDSUserName')
ALTER TABLE [dbo].[Settings] ADD [ADDSUserName] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'ADDSUserDomain')
ALTER TABLE [dbo].[Settings] ADD [ADDSUserDomain] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'ADDSPassword')
ALTER TABLE [dbo].[Settings] ADD [ADDSPassword] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'ReplicationSourceDC')
ALTER TABLE [dbo].[Settings] ADD [ReplicationSourceDC] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DatabasePath')
ALTER TABLE [dbo].[Settings] ADD [DatabasePath] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'ADDSLogPath')
ALTER TABLE [dbo].[Settings] ADD [ADDSLogPath] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'SysVolPath')
ALTER TABLE [dbo].[Settings] ADD [SysVolPath] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'SafeModeAdminPassword')
ALTER TABLE [dbo].[Settings] ADD [SafeModeAdminPassword] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'SiteName')
ALTER TABLE [dbo].[Settings] ADD [SiteName] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPServerOptionRouter')
ALTER TABLE [dbo].[Settings] ADD [DHCPServerOptionRouter] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPServerOptionDNSServer')
ALTER TABLE [dbo].[Settings] ADD [DHCPServerOptionDNSServer] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPServerOptionWINSServer')
ALTER TABLE [dbo].[Settings] ADD [DHCPServerOptionWINSServer] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPServerOptionDNSDomain')
ALTER TABLE [dbo].[Settings] ADD [DHCPServerOptionDNSDomain] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPServerOptionNBTNodeType')
ALTER TABLE [dbo].[Settings] ADD [DHCPServerOptionNBTNodeType] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPServerOptionPXEClient')
ALTER TABLE [dbo].[Settings] ADD [DHCPServerOptionPXEClient] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0SubnetMask')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0SubnetMask] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0IP')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0IP] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0Name')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0Name] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0Description')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0Description] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0StartIP')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0StartIP] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0EndIP')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0EndIP] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0ExcludeStartIP')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0ExcludeStartIP] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0ExcludeEndIP')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0ExcludeEndIP] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0OptionRouter')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0OptionRouter] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0OptionDNSServer')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0OptionDNSServer] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0OptionWINSServer')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0OptionWINSServer] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0OptionDNSDomainName')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0OptionDNSDomainName] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0OptionWINSServer')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0OptionWINSServer] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0OptionNBTNodeType')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0OptionNBTNodeType] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0OptionWINSServer')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0OptionWINSServer] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0OptionLease')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0OptionLease] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DHCPScopes0OptionPXEClient')
ALTER TABLE [dbo].[Settings] ADD [DHCPScopes0OptionPXEClient] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSZones')
ALTER TABLE [dbo].[Settings] ADD [DNSZones] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSZones0Name')
ALTER TABLE [dbo].[Settings] ADD [DNSZones0Name] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSZones0Type')
ALTER TABLE [dbo].[Settings] ADD [DNSZones0Type] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSZones0MasterIP')
ALTER TABLE [dbo].[Settings] ADD [DNSZones0MasterIP] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSZones0DirectoryPartition')
ALTER TABLE [dbo].[Settings] ADD [DNSZones0DirectoryPartition] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSZones0FileName')
ALTER TABLE [dbo].[Settings] ADD [DNSZones0FileName] [nvarchar] (255) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSZones0Scavenge')
ALTER TABLE [dbo].[Settings] ADD [DNSZones0Scavenge] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSZones0Update')
ALTER TABLE [dbo].[Settings] ADD [DNSZones0Update] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSServerOptionDisableRecursion')
ALTER TABLE [dbo].[Settings] ADD [DNSServerOptionDisableRecursion] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSServerOptionBINDSecondaries')
ALTER TABLE [dbo].[Settings] ADD [DNSServerOptionBINDSecondaries] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSServerOptionFailOnLoad')
ALTER TABLE [dbo].[Settings] ADD [DNSServerOptionFailOnLoad] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSServerOptionEnableRoundRobin')
ALTER TABLE [dbo].[Settings] ADD [DNSServerOptionEnableRoundRobin] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSServerOptionEnableNetmaskOrdering')
ALTER TABLE [dbo].[Settings] ADD [DNSServerOptionEnableNetmaskOrdering] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSServerOptionEnableSecureCache')
ALTER TABLE [dbo].[Settings] ADD [DNSServerOptionEnableSecureCache] [nvarchar] (50) NULL Default('')
GO

if not exists (select * from sys.columns where object_id = OBJECT_ID(N'[dbo].[Settings]') and name = 'DNSServerOptionNameCheckFlag')
ALTER TABLE [dbo].[Settings] ADD [DNSServerOptionNameCheckFlag] [nvarchar] (50) NULL Default('')
GO

		
/* ------------------------------------------------------------------------ */
/* Modify existing columns                                                  */
/* ------------------------------------------------------------------------ */

ALTER TABLE [dbo].[LocationIdentity] ALTER COLUMN [Location] [nvarchar] (255)
GO

ALTER TABLE [dbo].[RoleIdentity] ALTER COLUMN [Role] [nvarchar] (255)
GO


/* ------------------------------------------------------------------------ */
/* Refresh views so that they see the changes to the Settings table         */
/* ------------------------------------------------------------------------ */

EXEC sp_refreshview 'ComputerSettings'
GO

EXEC sp_refreshview 'RoleSettings'
GO

EXEC sp_refreshview 'LocationSettings'
GO

EXEC sp_refreshview 'MakeModelSettings'
GO


/* ------------------------------------------------------------------------ */
/* Descriptions                                                             */
/* ------------------------------------------------------------------------ */

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Descriptions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[Descriptions] (
	[ColumnName] [nvarchar] (255) NOT NULL CONSTRAINT [PK_Descriptions] PRIMARY KEY,
	[CategoryOrder] [int] DEFAULT (0),
	[Category] [nvarchar] (255) DEFAULT (''),
	[Description] [nvarchar] (255) DEFAULT ('')
)
GO

INSERT INTO [dbo].[Descriptions] VALUES ('OSDComputerName', 1, 'Identification', 'The new computer name to assign to the computer.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ComputerName', 1, 'Identification', 'This variable has been deprecated and should only be used for backwards compatibility.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OrgName', 1, 'Identification', 'The organization name that should be assigned to the computer.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('FullName', 1, 'Identification', 'The full name that should be assigned to the computer.')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('UDShare', 2, 'User Data', 'The UNC path where user data should be stored.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UDDir', 2, 'User Data', 'The directory that should be created to contain the user data.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UDProfiles', 2, 'User Data', 'A list of comma-separated usernames that should be captured.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ScanStateArgs', 2, 'User Data', 'Command line arguments for USMT Scanstate.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('LoadStateArgs', 2, 'User Data', 'Command line arguments for USMT Loadstate.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ComputerBackupLocation', 2, 'User Data', 'Specifies where the computer backup should be stored (AUTO, NETWORK, NONE, specific path, default is AUTO).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BackupShare', 2, 'User Data', 'Network share (UNC) where the computer backup should be stored.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BackupDir', 2, 'User Data', 'Directory on the network share where the computer backup should be stored.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BackupFile', 2, 'User Data', 'Sets the name of the backup file used with ztibackup')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UserDataLocation', 2, 'User Data', 'Specifies where the user data should be stored (AUTO, NETWORK, NONE, specific path, default is AUTO).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('CaptureGroups', 2, 'User Data', 'Specifies whether to capture the local group membership from the machine (default is YES; ALL can also be specified).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('USMTConfigFile', 2, 'User Data', 'USMT configuration XML file that should be used when running Scanstate and Loadstate.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('USMT3', 2, 'User Data', 'Designates to always use USMT 3 Valid values are YES or NO.')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('JoinWorkgroup', 3, 'Domain and Workgroup', 'The name of the workgroup in which the computer should be placed.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('JoinDomain', 3, 'Domain and Workgroup', 'The name of the domain in which the computer should be placed.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DomainAdmin', 3, 'Domain and Workgroup', 'The name of the account used to join the domain.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DomainAdminDomain', 3, 'Domain and Workgroup', 'The domain of the account used to join the domain.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DomainAdminPassword', 3, 'Domain and Workgroup', 'The password of the account used to join the domain.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('MachineObjectOU', 3, 'Domain and Workgroup', 'The OU in which the computer account should be created (if it does not already exist).')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('TimeZone', 4, 'Regional and Locale Settings', 'The time zone identifier that should be used for the computer (XP only).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('TimeZoneName', 4, 'Regional and Locale Settings', 'The time zone name that should be used for the computer (Vista only).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('KeyboardLocale', 4, 'Regional and Locale Settings', 'Locale used for Keyboard, can be either 0409:00000409 or en-US format (Vista only, default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('InputLocale', 4, 'Regional and Locale Settings', 'Locale used for keyboard, e.g. 0409:00000409 (XP only, default is OS default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UserLocale', 4, 'Regional and Locale Settings', 'Locale used for Keyboard, can be either 0409:00000409 or en-US format (default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SystemLocale', 4, 'Regional and Locale Settings', 'Locale used for System (default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UILanguage', 4, 'Regional and Locale Settings', 'Default language used for OS before user is logged in, en-US format (default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('AreaCode', 4, 'Regional and Locale Settings', 'Area code for the computers location.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('CountryCode', 4, 'Regional and Locale Settings', 'Country or region code to use for telephony.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('LongDistanceAccess', 4, 'Regional and Locale Settings', 'Number to dial to gain access to an outside line, such as 9.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('Dialing', 4, 'Regional and Locale Settings', 'Type of dialing to use for the telephony device in the computer, such as Tone or Pulse (XP only).')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('Xresolution', 5, 'Display Settings', 'The horizontal resolution of the screen (example: 1024, default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('Yresolution', 5, 'Display Settings', 'The vertical resolution of the screen (example: 768, default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BitsPerPel', 5, 'Display Settings', 'The color depth of the screen in bits per pixel (example: 32, default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('Vrefresh', 5, 'Display Settings', 'The vertical refresh rate of the monitor in Hz (example: 60, default is OS Default).')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('BdeInstall', 6, 'BitLocker', 'Specifies the type of BDE install. (ProtectKeyWithTpm, ProtectKeyWithTpmAndPin, ProtectKeyWithTpmAndStartupKey, ProtectKeyWithExternalKey)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BdeDriveLetter', 6, 'BitLocker', 'Drive Letter for BDE partition (default S:).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BdeDriveSize', 6, 'BitLocker', 'Drive size for BDE partition in MB (default 2048MB).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BdePin', 6, 'BitLocker', 'Specifies the startup Pin for BDE (only valid with ProtectKeyWithTpmAndPin).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BdeRecoveryKey', 6, 'BitLocker', 'Boolean (any value) creates a recovery key.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BdeKeyLocation', 6, 'BitLocker', 'Specifies the location of Key files (Fully qualified path or REMOVABLEDRIVE).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitlockerMode', 6, 'BitLocker', 'Specifies the type of BDE install. (KEY|TPMKey|TPMPin|TPM).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BDEInstallSuppress', 6, 'BitLocker', 'Value to indicate whether a BDE Install should be attempted. (YES or NO)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitLockerTargetDrive', 6, 'BitLocker', 'Specifies the drive to be encrypted (default OS Drive)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitLockerStartupKeyDrive', 6, 'BitLocker', 'Specifies the location of Key files (Drive)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitLockerCreateRecoveryPassword', 6, 'BitLocker', 'Indicates whether a recovery password should be generated for AD.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitLockerWaitForEncryption', 6, 'BitLocker', 'Boolean (any value) indicated whether process should be held to wait for drive encryption to complete.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BdeWaitForEncryption', 6, 'BitLocker', '(Deprecated) Boolean (any value) indicated whether process should be held to wait for drive encryption to complete.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('TpmOwnerPassword', 6, 'BitLocker', 'Specifies the TPM Password for setting ownership.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitLockerRecoveryPassword', 6, 'BitLocker', 'Specifies the password to use for BDE Password scenarios')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitLockerStartupKey', 6, 'BitLocker', 'Specifies the value to use for startup key.')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('SkipWizard', 7, 'Wizard Control', 'Skip wizard')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipCapture', 7, 'Wizard Control', 'Skip capture')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipAdminPassword', 7, 'Wizard Control', 'Skip admin password')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipApplications', 7, 'Wizard Control', 'Skip applications')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipAppsOnUpgrade', 7, 'Wizard Control', 'Skip applications on upgrade')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipComputerBackup', 7, 'Wizard Control', 'Skip computer backup')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipDomainMembership', 7, 'Wizard Control', 'Skip domain membership')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipComputerName', 7, 'Wizard Control', 'Skip computer name')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipDeploymentType', 7, 'Wizard Control', 'Skip deployment type')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipUserData', 7, 'Wizard Control', 'Skip user data')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipPackageDisplay', 7, 'Wizard Control', 'Skip package display')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipLocaleSelection', 7, 'Wizard Control', 'Skip locale selection')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipProductKey', 7, 'Wizard Control', 'Skip product key')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipSummary', 7, 'Wizard Control', 'Skip summary pane')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipFinalSummary', 7, 'Wizard Control', 'Skip the final summary pane presented at the end of a Lite Touch deployment (default is NO)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipBDDWelcome', 7, 'Wizard Control', 'Skip the Lite Touch welcome screen shown when booting from a Lite Touch Windows PE image (default is NO)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipTimeZone', 7, 'Wizard Control', 'Skip the time zone pane')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipBuild', 7, 'Wizard Control', 'Deprecated variable should only be used for backwards compatibility')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipTaskSequence', 7, 'Wizard Control', 'Skip the Task Sequence pane (requires that TaskSequenceID be set)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipDestinationDisk', 7, 'Wizard Control', 'Skip the DestinationDisk pane')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipBitLocker', 7, 'Wizard Control', 'Skip the BitLocker pane')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipBitLockerDetails', 7, 'Wizard Control', 'Skip the BitLocker details pane')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('UserID', 8, 'Miscellaneous', 'The user ID to be used to make network connections.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UserPassword', 8, 'Miscellaneous', 'The password to be used to make network connections.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UserDomain', 8, 'Miscellaneous', 'The domain to be used to make network connections.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SLShare', 8, 'Miscellaneous', 'The UNC path where logs should be copied.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SLShareDynamicLogging', 8, 'Miscellaneous', 'Script log share where all MDT events should be written during execution (advanced debugging only)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('EventShare', 8, 'Miscellaneous', 'The UNC path where events for the management pack should be placed.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSInstall', 8, 'Miscellaneous', 'A flag to indicate that a new OS can be deployed to this computer, set to Y to authorize.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('Home_Page', 8, 'Miscellaneous', 'Internet Explorer home page.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DoCapture', 8, 'Miscellaneous', 'Flag to indicate that the machine should be Sysprepped and captured as a new WIM image (default is NO).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ProductKey', 8, 'Miscellaneous', 'Product key (non-MAK key).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OverrideProductKey', 8, 'Miscellaneous', 'Override product key (MAK key).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('WDSServer', 8, 'Miscellaneous', 'Name of the WDS server that should be used when installing WDS images (default is the server that contains the original image).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('AdminPassword', 8, 'Miscellaneous', 'Local Administrator password')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BuildID', 8, 'Miscellaneous', 'Deprecated, should only be used for backwards compatibility')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('TaskSequenceID', 8, 'Miscellaneous', 'TaskSequence ID used to automate LTI task sequence selection (default is blank)')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('DriverGroup', 8, 'Miscellaneous', 'Specifies the name of the driver group from which drivers should be injected')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('DriverSelectionProfile', 8, 'Miscellaneous', 'Profile name used during driver installation.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('PackageSelectionProfile', 8, 'Miscellaneous', 'Profile name used during Package installation.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('WizardSelectionProfile', 8, 'Miscellaneous','Profile name used by the wizard for filtering the display of various items.')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('ServerA', 8, 'Miscellaneous', 'Specifies the name of a server to be used during the deployment process')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ServerB', 8, 'Miscellaneous', 'Specifies the name of a server to be used during the deployment process')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ServerC', 8, 'Miscellaneous', 'Specifies the name of a server to be used during the deployment process')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ResourceRoot', 8, 'Miscellaneous', 'Specifies the name of a server to be used during the deployment process for resources like drivers, language packs, and hotfixes.  (This should be set for ZTI only.)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ApplicationSuccessCodes', 8, 'Miscellaneous', 'Space delimited list of error codes allowed by ZTIApplications.wsf (default: 0 3010)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('_SMSTSORGNAME', 8, 'Miscellaneous', 'Customizes the Task Sequencer engine display banner.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('WsusServer', 8, 'Miscellaneous', 'The URL of the WSUS server that should be used (optional, will use Windows Update or policy settings by default)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('WipeDisk', 8, 'Miscellaneous', 'Specifies whether the disk should be wiped. (Replace Only)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('FinishAction', 8, 'Miscellaneous', 'Specifies what action should be taken when a Lite Touch task sequence completes (SHUTDOWN, REBOOT, LOGOFF, or default of none)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SMSTSRunCommandLineUserName', 8, 'Miscellaneous', 'Specifies the username (e.g. DOM\USER) that should be used with a Run Command Line action that is configure to run as user')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SMSTSRunCommandLineUserPassword', 8, 'Miscellaneous', 'Specifies the password that should be used with a Run Command Line action that is configure to run as user')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('OSDINSTALLSILENT', 9, 'SMS 2003 OSD', 'A flag to indicate that OSD should not display the OSD Image Installation wizard for new computer installs.  This should be set to 1 to skip the wizard, blank to show the wizard.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDINSTALLPACKAGE', 9, 'SMS 2003 OSD', 'The package ID (e.g. XXX00001) of the OSD package that should be installed on the computer.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDINSTALLPROGRAM', 9, 'SMS 2003 OSD', 'The program name (e.g. Install) that exists in the specified OSD package that should be installed on the computer.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDNEWMACHINENAME', 9, 'SMS 2003 OSD', 'Deprecated, should only be used for backwards compatibility')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDMP', 9, 'SMS 2003 OSD', 'OSD variable to indicate which SMS management point (servername:port) should be used (only needed for new computer).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDSITECODE', 9, 'SMS 2003 OSD', 'OSD variable to indicate which SMS site code should be used (only needed for new computer).')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapterCount', 10, 'NIC Settings', 'Number of Adapters defined here( either blank, 0 or 1)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0Name', 10, 'NIC Settings', 'If present, match all settings to the adapter with this name.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0MacAddress', 10, 'NIC Settings', 'If present, match all settings to the adapter with this MAC address.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0EnableDHCP', 10, 'NIC Settings', 'If false, will disable DHCP, otherwise True (true if blank).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0IPAddressList', 10, 'NIC Settings', 'Comma delimited list of IPAddress Lists')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0SubnetMask', 10, 'NIC Settings', 'Comma delimited list of Subnet masks')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0Gateways', 10, 'NIC Settings', 'Comma delimited list of Gateway cost metrics')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0GatewayCostMetric', 10, 'NIC Settings', 'Comma delimited list of Gateway Cost Metrics as either integers, or the string Automatic (if empty, uses automatic)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0DNSServerList', 10, 'NIC Settings', 'Comma delimited list of DNS Servers')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0DNSSuffix', 10, 'NIC Settings', 'DNS Suffix, example Frabrikam.com')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0EnableDNSRegistration', 10, 'NIC Settings', 'True/False to enable DNS registration.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0EnableFullDNSRegistration', 10, 'NIC Settings', 'True/False to enable FULL DNS registration.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0EnableLMHOSTS', 10, 'NIC Settings', 'True/False to enable LMHosts')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0EnableWINS', 10, 'NIC Settings', 'True/False to enable WINS')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0TcpipNetbiosOptions', 10, 'NIC Settings', 'NetBIOS OPtions 1 or 0')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0WINSServerList', 10, 'NIC Settings', 'Comma delimited list of WINS Servers')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0EnableTCPIPFiltering', 10, 'NIC Settings', 'True/False to enable TCP/IP Filtering.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0TCPFilterPortList', 10, 'NIC Settings', 'Comma delimited list of TCP Filters')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0UDPFilterPortList', 10, 'NIC Settings', 'Comma delimited list of UDP Filters')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0IPProtocolFilterList', 10, 'NIC Settings', 'Comma delimited list of IP Protocol FIlters')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('OSDDiskIndex', 11, 'Disk Settings', 'Disk index used for Partitioning (Default is 0)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions', 11, 'Disk Settings', 'Number of Partitions listed here (Default is None, max of 2, use Default configuration)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0TYPE', 11, 'Disk Settings', 'Type of partition (Default: Primary, can be Logical or extended)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0FILESYSTEM', 11, 'Disk Settings', 'Type of File System (Default: NTFS, can be FAT32)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0BOOTABLE', 11, 'Disk Settings', 'True/False - Is the partition bootalbe')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0QUICKFORMAT', 11, 'Disk Settings', 'True/False - Shall the format be quick (default: True)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0VOLUMENAME', 11, 'Disk Settings', 'Volume name')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0SIZE', 11, 'Disk Settings', 'Size of partition')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0SIZEUNITS', 11, 'Disk Settings', 'Size units of partition (default: MB, can be GB or percentage )')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0VOLUMELETTERVARIABLE', 11, 'Disk Settings', 'Variable Name to receive DriveLetter')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1TYPE', 11, 'Disk Settings', 'Type of partition (Default: Primary, can be Logical or extended)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1FILESYSTEM', 11, 'Disk Settings', 'Type of File System (Default: NTFS, can be FAT32)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1BOOTABLE', 11, 'Disk Settings', 'True/False - Is the partition bootalbe (default: True if 1st partition)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1QUICKFORMAT', 11, 'Disk Settings', 'True/False - Shall the format be quick (default: True)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1VOLUMENAME', 11, 'Disk Settings', 'Volume name')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1SIZE', 11, 'Disk Settings', 'Size of partition')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1SIZEUNITS', 11, 'Disk Settings','Size units of partition (default: MB, can be GB or percentage)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1VOLUMELETTERVARIABLE', 11, 'Disk Settings', 'Variable Name to receive DriveLetter')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DoNotCreateExtraPartition', 11, 'Disk Settings', 'Specifies that Windows 7 and Windows Server 2008R2 will not create the 300 MB system partition')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('OSRoles', 12, 'OS Roles', 'Comma-delimited list of role IDs to be installed')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSRoleService', 12, 'OS Roles', 'Comma-delimited list of role service IDs to be installed')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSFeatures', 12, 'OS Roles', 'Comma-delimited list of features to be installed')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('AutoMode', 12, 'OS Roles', 'Sets AutoMode for Server 2003 deployments')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('AutoUsers', 12, 'OS Roles', 'Sets AutoUsers for Server 2003 deployments')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('ReplicaOrNewDomain', 13, 'ADDS Settings', 'Chooses whether the domain controller will be a replica or part of a new domain')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('NewDomain', 13, 'ADDS Settings', 'Choice between a new forest or new domain in an existing tree or a new domain in a new tree')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('NewDomainDNSName', 13, 'ADDS Settings', 'DNS domain name of new domain')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ParentDomainDNSName', 13, 'ADDS Settings', 'Parent DNS domain')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ReplicaDomainDNSName', 13, 'ADDS Settings', 'Replica DNS domain')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ChildName', 13, 'ADDS Settings', 'Name of child domain')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DomainNetBiosName', 13, 'ADDS Settings', 'NetBios Name')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ForestLevel', 13, 'ADDS Settings', 'Forest Level')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DomainLevel', 13, 'ADDS Settings', 'Domain functional level')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('AutoConfigDNS', 13, 'ADDS Settings', 'Chooses to auto configure DNS')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ConfirmGC', 13, 'ADDS Settings', 'Chooses whether to Confirm communication to GC')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('CriticalReplicationOnly', 13, 'ADDS Settings', 'Chooses to only replicate critical information')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ADDSUserName', 13, 'ADDS Settings', 'Username chosen to run dcpromo')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ADDSUserDomain', 13, 'ADDS Settings', 'Domain for user chosen to run dcpromo')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ADDSPassword', 13, 'ADDS Settings', 'Password for user chosen to run dcpromo')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ReplicationSourceDC', 13, 'ADDS Settings', 'DC used to replicate content')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DatabasePath', 13, 'ADDS Settings', 'Path to store the AD database')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ADDSLogPath', 13, 'ADDS Settings', 'Path to store the AD database logs')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SysVolPath', 13, 'ADDS Settings', 'Path to store the SYSVOL')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SafeModeAdminPassword', 13, 'ADDS Settings', 'Password used for safemode recovery')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SiteName', 13, 'ADDS Settings', 'AD SiteName')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('DHCPServerOptionRouter', 14, 'DHCP Server Settings', 'Routers for the DHCP Server Option')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPServerOptionDNSServer', 14, 'DHCP Server Settings', 'DNS Server for the DHCP Server Option')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPServerOptionWINSServer', 14, 'DHCP Server Settings', 'WINS Server for the DHCP Server Option')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPServerOptionDNSDomain', 14, 'DHCP Server Settings', 'DNS domain for the DHCP Server Option')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPServerOptionNBTNodeType', 14, 'DHCP Server Settings', 'NBT NodeType for the DHCP Server Option')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPServerOptionPXEClient', 14, 'DHCP Server Settings', 'PXE Client option for the DHCP Server Option')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes', 14, 'DHCP Server Settings', 'Number of DHCP Scopes to Configure')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0SubnetMask', 14, 'DHCP Server Settings', 'Subnet mask for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0IP', 14, 'DHCP Server Settings', 'IP Subnet for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0Name', 14, 'DHCP Server Settings', 'Name for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0Description', 14, 'DHCP Server Settings', 'Description for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0StartIP', 14, 'DHCP Server Settings', 'Starting IP address the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0EndIP', 14, 'DHCP Server Settings', 'Ending IP for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0ExcludeStartIP', 14, 'DHCP Server Settings', 'Start of the excluding IP range for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0ExcludeEndIP', 14, 'DHCP Server Settings', 'End of the excluding IP range for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionRouter', 14, 'DHCP Server Settings', 'Router of the excluding IP range for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionDNSServer', 14, 'DHCP Server Settings', 'DNS Server for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionWINSServer', 14, 'DHCP Server Settings', 'WINS Server for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionDNSDomainName', 14, 'DHCP Server Settings', 'DNS Domain Name for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionNBTNodeType', 14, 'DHCP Server Settings', 'NBT Node Type for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionLease', 14, 'DHCP Server Settings', 'Lease Duration for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionPXEClient', 14, 'DHCP Server Settings', 'PXE Client for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UserName', 14, 'DHCP Server Settings', 'Username used to authorize DHCP')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('Password', 14, 'DHCP Server Settings', 'Password used to authorize DHCP')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones', 15, 'DNS Server Settings', 'Number of DNS Zones to Configure')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0Name', 15, 'DNS Server Settings', 'Name of the first DNS Zone')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0Type', 15, 'DNS Server Settings', 'Type of Zone')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0MasterIP', 15, 'DNS Server Settings', 'Primary IP for the zone')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0DirectoryPartition', 15, 'DNS Server Settings', 'AD Partition to store the zone')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0FileName', 15, 'DNS Server Settings', 'File Name of the first DNS Zone')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0Scavenge', 15, 'DNS Server Settings', 'Enables scavenging')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0Update', 15, 'DNS Server Settings', 'Enables dynamic updates')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionDisableRecursion', 15, 'DNS Server Settings', 'Disables recursion on the DNS server')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionBINDSecondaries', 15, 'DNS Server Settings', 'Allows BIND secondaries')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionFailOnLoad', 15, 'DNS Server Settings', 'Toggles fail on load')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionEnableRoundRobin', 15, 'DNS Server Settings', 'Enables Round Robin')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionEnableNetmaskOrdering', 15, 'DNS Server Settings', 'Enables netmask ordering')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionEnableSecureCache', 15, 'DNS Server Settings', 'Enables cache security')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionNameCheckFlag', 15, 'DNS Server Settings', 'Name Check Flag')
GO
