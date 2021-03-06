
/* ------------------------------------------------------------------------ */
/* Initialization                                                           */
/* ------------------------------------------------------------------------ */

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON
GO


/* ------------------------------------------------------------------------ */
/* Create Groups table                                                      */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Groups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL Default(''),
	[Description] [nvarchar](255) NULL Default(''),
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
) 
END
GO


/* ------------------------------------------------------------------------ */
/* Add default entries to table                                             */
/* ------------------------------------------------------------------------ */

SET IDENTITY_INSERT [dbo].[Groups] ON
INSERT [dbo].[Groups] ([ID], [Name], [Description]) VALUES (1, N'MDT 2008 Default', N'MDT 2008 Default Settings')
INSERT [dbo].[Groups] ([ID], [Name], [Description]) VALUES (2, N'MDT 2010 Default', N'MDT 2010 Default Settings')
INSERT [dbo].[Groups] ([ID], [Name], [Description]) VALUES (3, N'Example', N'Example for Testing')
SET IDENTITY_INSERT [dbo].[Groups] OFF


/* ------------------------------------------------------------------------ */
/* Create Categories table                                                  */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO

/* ------------------------------------------------------------------------ */
/* Add default entries to table                                             */
/* ------------------------------------------------------------------------ */

SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (1, N'BitLocker', N'BitLocker (MDT 2008)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (2, N'Display Settings', N'Display Settings')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (3, N'Domain and Workgroup', N'Domain and Workgroup')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (4, N'Identification', N'Identification (MDT 2008)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (5, N'Miscellaneous', N'Miscellaneous (MDT 2008)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (6, N'Regional and Locale Settings', N'Regional and Locale Settings (MDT 2008)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (7, N'SMS 2003 OSD', N'SMS 2003 OSD')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (8, N'User Data', N'User Data (MDT 2008)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (9, N'Wizard Control', N'Wizard Control (MDT 2008)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (10, N'ASDS Settings', N'ASDS Settings (MDT 2010)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (11, N'BitLocker', N'BitLocker (MDT 2010)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (12, N'DHCP Server Settings', N'DHCP Server Settings (MDT 2010)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (13, N'Disk Settings', N'Disk Settings (MDT 2010)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (14, N'DNS Server Settings', N'DNS Server Settings (MDT 2010)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (15, N'Identification', N'Identification (MDT 2010)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (16, N'Miscellaneous', N'Miscellaneous (MDT 2010)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (17, N'NIC Settings', N'NIC Settings (MDT 2010)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (18, N'OS Roles', N'OS Roles (MDT 2010)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (19, N'Regional and Locale Settings', N'Regional and Locale Settings (MDT 2010)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (20, N'User Data', N'User Data (MDT 2010)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (21, N'Custom', N'Custom (MDT 2010)')
INSERT [dbo].[Categories] ([ID], [Name], [Description]) VALUES (22, N'Example', N'Example for Testing')
SET IDENTITY_INSERT [dbo].[Categories] OFF


/* ------------------------------------------------------------------------ */
/* Create Users table                                                       */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[Username] [nvarchar](50) NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[PasswordQuestion] [nvarchar](255) NULL,
	[PasswordAnswer] [nvarchar](255) NULL,
	[IsApproved] [bit] NULL,
	[LastActivityDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[LastPasswordChangedDate] [datetime] NULL,
	[IsOnline] [bit] NULL,
	[IsLockedOut] [bit] NULL,
	[LockedOutDate] [datetime] NULL,
	[FailedPasswordAttemptCount] [int] NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NULL,
	[FailedPasswordAnswerAttemptCount] [int] NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NULL,
	[LastModified] [datetime] NULL,
	[Comment] [nvarchar](255) NULL,
	[IsAnonymous] [bit] NULL,
	[IsAdmin] [bit] NULL Default(0),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
) 
END
GO

/* ------------------------------------------------------------------------ */
/* Create Lists table                                                       */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lists]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[Multiple] [bit] NULL Default(0),
 CONSTRAINT [PK_Lists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO

/* ------------------------------------------------------------------------ */
/* Add default entries to table                                             */
/* ------------------------------------------------------------------------ */

SET IDENTITY_INSERT [dbo].[Lists] ON
INSERT [dbo].[Lists] ([ID], [Name], [Description], [Multiple]) VALUES (1, N'YesNo', N'Yes, No', 0)
INSERT [dbo].[Lists] ([ID], [Name], [Description], [Multiple]) VALUES (2, N'YesNoAll', N'Yes, No, All', 0)
INSERT [dbo].[Lists] ([ID], [Name], [Description], [Multiple]) VALUES (3, N'TrueFalse', N'True, False', 0)
INSERT [dbo].[Lists] ([ID], [Name], [Description], [Multiple]) VALUES (4, N'TimeZone', N'Timezones', 0)
INSERT [dbo].[Lists] ([ID], [Name], [Description], [Multiple]) VALUES (5, N'TimeZoneName', N'Timezonenames', 0)
SET IDENTITY_INSERT [dbo].[Lists] OFF

/* ------------------------------------------------------------------------ */
/* Create AccessRoles table                                                 */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccessRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccessRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Type] [nchar](1) NULL,
	[Details] [tinyint] NULL,
	[Settings] [tinyint] NULL,
	[Applications] [tinyint] NULL,
	[Packages] [tinyint] NULL,
	[Administrators] [tinyint] NULL,
	[Gateways] [tinyint] NULL,
	[Roles] [tinyint] NULL,
	[Default] [bit] NULL Default(0),
	[GroupID] [int] NULL,
 CONSTRAINT [PK_AccessRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccessRoles_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccessRoles]'))
ALTER TABLE [dbo].[AccessRoles]  WITH CHECK ADD  CONSTRAINT [FK_AccessRoles_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccessRoles_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccessRoles]'))
ALTER TABLE [dbo].[AccessRoles] CHECK CONSTRAINT [FK_AccessRoles_Groups]
GO

/* ------------------------------------------------------------------------ */
/* Add default entries to table                                             */
/* ------------------------------------------------------------------------ */

SET IDENTITY_INSERT [dbo].[AccessRoles] ON
INSERT [dbo].[AccessRoles] ([ID], [Name], [Description], [Type], [Details], [Settings], [Applications], [Packages], [Administrators], [Gateways], [Roles], [Default], [GroupID]) VALUES (1, N'Default Access All', N'Default Role with Full access to all Identities', N'A', 2, 2, 2, 2, 2, 2, 2, 1, 1)
INSERT [dbo].[AccessRoles] ([ID], [Name], [Description], [Type], [Details], [Settings], [Applications], [Packages], [Administrators], [Gateways], [Roles], [Default], [GroupID]) VALUES (2, N'Example ReadOnly', N'Example for Testing', N'A', 1, 1, 1, 1, 1, 1, 1, 0, 3)
SET IDENTITY_INSERT [dbo].[AccessRoles] OFF


/* ------------------------------------------------------------------------ */
/* Create Categories_Groups table                                           */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories_Groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories_Groups](
	[GroupID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Sequence] [int] NULL,
 CONSTRAINT [PK_Categories_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
) 
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Categories_Groups_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Categories_Groups]'))
ALTER TABLE [dbo].[Categories_Groups]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Groups_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Categories_Groups_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Categories_Groups]'))
ALTER TABLE [dbo].[Categories_Groups] CHECK CONSTRAINT [FK_Categories_Groups_Categories]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Categories_Groups_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Categories_Groups]'))
ALTER TABLE [dbo].[Categories_Groups]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Groups_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Categories_Groups_Groups]') AND parent_object_id = OBJECT_ID(N'[dbo].[Categories_Groups]'))
ALTER TABLE [dbo].[Categories_Groups] CHECK CONSTRAINT [FK_Categories_Groups_Groups]
GO


/* ------------------------------------------------------------------------ */
/* Add default entries to table                                             */
/* ------------------------------------------------------------------------ */

INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (1, 1, 1)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (1, 2, 2)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (1, 3, 3)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (1, 4, 4)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (1, 5, 5)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (1, 6, 6)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (1, 7, 7)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (1, 8, 8)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (1, 9, 9)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 2, 5)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 3, 7)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 7, 13)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 9, 15)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 10, 1)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 11, 2)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 12, 3)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 13, 4)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 14, 6)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 15, 8)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 16, 9)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 17, 10)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 18, 11)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 19, 12)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 20, 14)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (2, 21, 16)
INSERT [dbo].[Categories_Groups] ([GroupID], [CategoryID], [Sequence]) VALUES (3, 22, 1)


/* ------------------------------------------------------------------------ */
/* Create Settings_Categories table                                         */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Settings_Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Settings_Categories](
	[CategoryID] [int] NOT NULL,
	[Column_Name] [nvarchar](255) NOT NULL,
	[Sequence] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[ReadOnly] [bit] NULL Default(0),
	[Type] [nvarchar](255) NULL,
	[ListID] [int] NULL,
 CONSTRAINT [PK_Settings_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC,
	[Column_Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
) 
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Settings_Categories_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Settings_Categories]'))
ALTER TABLE [dbo].[Settings_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Settings_Categories_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Settings_Categories_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Settings_Categories]'))
ALTER TABLE [dbo].[Settings_Categories] CHECK CONSTRAINT [FK_Settings_Categories_Categories]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Settings_Categories_Lists]') AND parent_object_id = OBJECT_ID(N'[dbo].[Settings_Categories]'))
ALTER TABLE [dbo].[Settings_Categories]  WITH CHECK ADD  CONSTRAINT [FK_Settings_Categories_Lists] FOREIGN KEY([ListID])
REFERENCES [dbo].[Lists] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Settings_Categories_Lists]') AND parent_object_id = OBJECT_ID(N'[dbo].[Settings_Categories]'))
ALTER TABLE [dbo].[Settings_Categories] CHECK CONSTRAINT [FK_Settings_Categories_Lists]
GO

/* ------------------------------------------------------------------------ */
/* Add default entries to table                                             */
/* ------------------------------------------------------------------------ */

INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (1, N'BdeDriveLetter', 1, N'', N'Drive Letter for BDE partition (default S:)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (1, N'BdeDriveSize', 2, N'', N'Drive size for BDE partition in MB (default 2048 MB)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (1, N'BdeInstall', 3, N'', N'Specifies the type of BDE install. (ProtectKeyWithTPM, ProtectKeyWithTpmAndPin, ProtectKeyWithTpmAndStartupKey, ProtectKeyWithExternalKey)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (1, N'BdeKeyLocation', 4, N'', N'Specifies the location of Key files (Fully qualified path or ''REMOVEABLEDRIVE'')', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (1, N'BdePin', 5, N'', N'Specifies the startup Pin for BDE (only valid with ProtectKeyWithTpmAndPin)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (1, N'BdeRecoveryKey', 6, N'', N'Boolean (any value) creates a recovery key.', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (1, N'TpmOwnerPassword', 7, N'', N'Specifies the TPM Password for setting ownership', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (2, N'BitsPerPel', 1, N'', N'The color depth of the screen in bits per pixel (example: 32, default is OS Default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (2, N'Vrefresh', 2, N'', N'The vertical refresh rate of the monitor in Hz (example: 60, default is OS Default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (2, N'Xresolution', 3, N'', N'The horizontal resolution of the screen (example: 1024, default is OS Default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (2, N'Yresolution', 4, N'', N'The vertical resolution of the screen (example: 768, default is OS Default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (3, N'DomainAdmin', 1, N'', N'The name of the account used to join the domain', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (3, N'DomainAdminDomain', 2, N'', N'The domain of the account used to join the domain', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (3, N'DomainAdminPassword', 3, N'', N'The password for the account used to join the domain', 0, N'Password', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (3, N'JoinDomain', 4, N'', N'The domain to join', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (3, N'JoinWorkGroup', 5, N'', N'The name of the workgroup in which the computer should be placed', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (3, N'MachineObjectOU', 6, N'', N'The OU in which the computer account should be created (if it doesn''t already exist)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (4, N'ComputerName', 1, N'', N'The name that should be assigned to the computer', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (4, N'FullName', 2, N'', N'The full name that should be assigned to the computer', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (4, N'OrgName', 3, N'', N'The organization name that should be assigned to the computer', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'AdminPassword', 1, N'', N'Local Administrator password', 0, N'Password', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'BuildID', 2, N'', N'Build ID used to automate LTI build selection (default is blank)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'DoCapture', 3, N'', N'Flag to indicate that the machine should be Sysprepped and captured as a new WIM image (default is NO)', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'DriverGroup', 4, N'', N'Specifies the name of the driver group from which drivers should be injected', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'EventShare', 5, N'', N'The UNC path where events for the ZTI management pack should be placed', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'Home_Page', 6, N'', N'Home page', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'OSInstall', 7, N'', N'A flag to indicate that a new OS can be deployed to this computer, set to ''Y'' to authorize', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'OverrideProductKey', 8, N'', N'Override product key', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'ProductKey', 9, N'', N'Product key', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'ResourceRoot', 10, N'', N'Specifies the name of a server to be used during the deployment process for resources like drivers, language packs, and hotfixes. (This should be set for ZTI only.)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'ServerA', 11, N'', N'Specifies the name of a server to be used during the deployment process', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'ServerB', 12, N'', N'Specifies the name of a server to be used during the deployment process', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'ServerC', 13, N'', N'Specifies the name of a server to be used during the deployment process', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'SLShare', 14, N'', N'The UNC path where logs should be copied', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (5, N'WDSServer', 15, N'', N'Name of the WDS server that should be used when installing WDS images (default is the server that contains he original image)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (6, N'AreaCode', 1, N'', N'Area code for the computer''s location', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (6, N'CountryCode', 2, N'', N'Country or region code to use for telephony', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (6, N'Dialing', 3, N'', N'Type of dialing to use for the telephony device in the computer, such as ''Tone'' or ''Pulse'' (XP only)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (6, N'InputLocale', 4, N'', N'Locale used for keyboard, e.g. 0409:00000409 (XP only, default is OS default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (6, N'KeyboardLocale', 5, N'', N'Locale used for Keyboard, can be either 0409:00000409 or en-US format (Vista only, default is OS Default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (6, N'LongDistanceAccess', 6, N'', N'Number to dial to gain access to an outside line, such as 9', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (6, N'TimeZone', 7, N'', N'The time zone identifier that should be used for the computer (XP only)', 0, N'List', 4)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (6, N'TimeZoneName', 8, N'', N'The time zone identifier that should be used for the computer (Vista only)', 0, N'List', 5)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (6, N'UILanguage', 9, N'', N'Default language used for OS before user is logged in, en-US format (default is OS Default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (6, N'UserLocale', 10, N'', N'Locale used for Keyboard, can be either 0409:00000409 or en-US format (default is OS Default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (7, N'OSDINSTALLPACKAGE', 1, N'', N'The package ID (e.g. XXX00001 of the OSD package that should be installed on the computer', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (7, N'OSDINSTALLPROGRAM', 2, N'', N'The program name (e.g. Install) that exists in the specified OSD package that should be installed on the computer', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (7, N'OSDINSTALLSILENT', 3, N'', N'A flag to indicate that OSD should not display the OSD Image Installation wizard for ''new computer'' installs. This should be set to 1 to skip the wizard, blank to show the wizard', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (7, N'OSDMP', 4, N'', N'OSD variable to indicate which SMS management point (servername:port) shoud be used (only needed for new computer)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (7, N'OSDNEWMACHINENAME', 5, N'', N'The name that should be assigned to the computer, only used for OSD ''new computer'' installations', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (7, N'OSDSITECODE', 6, N'', N'OSD variable to indicate which SMS site code should be used (only needed for new computer)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (8, N'BackupDir', 1, N'', N'Directory on the network share where the computer backup should be stored', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (8, N'BackupShare', 2, N'', N'Network share (UNC) where the computer backup should be stored', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (8, N'CaptureGroups', 3, N'', N'Specifies wether to capture the local group membership from the machine (default is YES; ALL can also be specified)', 0, N'List', 2)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (8, N'ComputerBackupLocation', 4, N'', N'Specifies where the computer backup should be stored (AUTO, NETWORK, NONE, specific path, default is AUTO)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (8, N'LoadStateArgs', 5, N'', N'Command line arguments for USMT Loadstate', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (8, N'ScanStateArgs', 6, N'', N'Command line arguments for USMT Scanstate', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (8, N'UDDir', 7, N'', N'The directory that should be created to contain the user data', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (8, N'UDProfiles', 8, N'', N'A list of comma-separated username that should be captured', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (8, N'UDShare', 9, N'', N'The UNC path where user data should be stored', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (8, N'UserDataLocation', 10, N'', N'Specifies where the user data should be stored (AUTO, NETWORK, NONE, specific Path, default is AUTO)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipAdminPassword', 1, N'', N'Skip admin password', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipApplications', 2, N'', N'Skip applications', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipAppsOnUpgrade', 3, N'', N'Skip apps on upgrade', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipBDDWelcome', 4, N'', N'Skip the Lite Touch welcome screen shown when booting from a Lite Touch Windows PE image (defaut is NO)', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipBitLocker', 5, N'', N'Skip the BitLocker pane', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipBitLockerDetails', 6, N'', N'Skip the BitLocker details pane', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipBuild', 7, N'', N'Skip the build pane (requires that BuildID be set)', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipCapture', 8, N'', N'Skip capture', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipComputerBackup', 9, N'', N'Skip computer backup', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipComputerName', 10, N'', N'Skip computer name', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipDeploymentType', 11, N'', N'Skip deployment type', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipDomainMembership', 12, N'', N'Skip domain membership', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipFinalSummary', 13, N'', N'Skip the final summary pane presented at the end of a Lite Touch deployment (default is NO)', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipLocaleSelection', 14, N'', N'Skip locale selection', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipPackageDisplay', 15, N'', N'Skip package display', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipProductKey', 16, N'', N'Skip product key', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipSummary', 17, N'', N'Skip summary pane', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipTimeZone', 18, N'', N'Skip time zone pane', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipUserData', 19, N'', N'Skip user data', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (9, N'SkipWizard', 20, N'', N'Skip wizard', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'ADDSLogPath', 1, N'', N'Path to store the AD database logs', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'ADDSPassword', 2, N'', N'Password for user chosen to run dcpromo', 0, N'Password', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'ADDSUserDomain', 3, N'', N'Domain for user chosen to run dcpromo', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'ADDSUserName', 4, N'', N'Username chosen to run dcpromo', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'AutoConfigDNS', 5, N'', N'Chooses to auto configure DNS', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'ChildName', 6, N'', N'Name of child domain', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'ConfirmGC', 7, N'', N'Chooses wether to confirm communication to GC', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'CriticalReplicationOnly', 8, N'', N'Chooses to only replicate critical information', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'DatabasePath', 9, N'', N'Path to store the AD database', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'DomainLevel', 10, N'', N'Domain functional level', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'DomainNetBiosName', 11, N'', N'NetBios Name', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'ForestLevel', 12, N'', N'Forest Level', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'NewDomain', 13, N'', N'Choice between a new forest or a new domain in an existing tree or a new domain in a new tree', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'NewDomainDNSName', 14, N'', N'DNS domain name of new domain', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'ParentDomainDNSName', 15, N'', N'Parent DNS domain', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'ReplicaDomainDNSName', 16, N'', N'Replica DNS domain', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'ReplicaOrNewDomain', 17, N'', N'Chooses wether the domain controller will be a replica or part of a new domain', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'ReplicationSourceDC', 18, N'', N'DC used to replicate content', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'SafeModeAdminPassword', 19, N'', N'Password used for safemode recovery', 0, N'Password', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'SiteName', 20, N'', N'AD SiteName', 0, N'Text', NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (10, N'SysVolPath', 21, N'', N'Path to store the SYSVOL', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'BdeDriveLetter', 1, N'', N'Drive Letter for BDE partition (default S:)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'BdeDriveSize', 2, N'', N'Drive size for BDE partition in MB (default 2048 MB)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'BdeInstall', 3, N'', N'Specifies the type of BDE install. (ProtectKeyWithTPM, ProtectKeyWithTpmAndPin, ProtectKeyWithTpmAndStartupKey, ProtectKeyWithExternalKey)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'BdeInstallSuppress', 4, N'', N'Value to indicate wether a BDE Install should be attempted. (YES or NO)', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'BdeKeyLocation', 5, N'', N'Specifies the location of Key files (Fully qualified path or ''REMOVEABLEDRIVE'')', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'BdePin', 6, N'', N'Specifies the startup Pin for BDE (only valid with ProtectKeyWithTpmAndPin)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'BdeRecoveryKey', 7, N'', N'Boolean (any value) creates a recovery key.', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'BDEWaitForEncryption', 8, N'', N'(Deprecated) Boolean (any value) indicated wether the process should be held to wait for drive encryption to complete', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'OSDBitLockerCreateRecoveryPassword', 9, N'', N'Indicates wether a recovery password should be generated for AD', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'OSDBitlockerMode', 10, N'', N'Specifies the type of BDE install. (KEY|TPMKey|TPMPin|TPM)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'OSDBitLockerRecoveryPassword', 11, N'', N'Specifies the password to use for BDE Password scenarios', 0, N'Password', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'OSDBitLockerStartupKey', 12, N'', N'Specifies the value to use for the startup key', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'OSDBitLockerStartupKeyDrive', 13, N'', N'Specifies the location of Key files (Drive)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'OSDBitLockerWaitForEncryption', 14, N'', N'Boolean (any value) indicated wether process should be held to wait for drive encryption to complete', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (11, N'TpmOwnerPassword', 15, N'', N'Specifies the TPM Password for setting ownership', 0, N'Password', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes', 1, N'', N'Number of DHCP Scopes to Configure', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0Description', 2, N'', N'Description for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0EndIP', 3, N'', N'Ending IP for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0ExcludeEndIP', 4, N'', N'End of the excluding IP range for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0ExcludeStartIP', 5, N'', N'Start of the excluding IP range for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0IP', 6, N'', N'IP Subnet for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0Name', 7, N'', N'Name for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0OptionDNSDomainName', 8, N'', N'DNS Domain name for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0OptionDNSServer', 9, N'', N'DNS Server for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0OptionLease', 10, N'', N'Lease Duration for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0OptionNBTNodeType', 11, N'', N'NBT Node Type for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0OptionPXEClient', 12, N'', N'PXE Client for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0OptionRouter', 13, N'', N'Router of the excluding IP range for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0OptionWINSServer', 14, N'', N'WINS Server for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0StartIP', 15, N'', N'Starting IP address for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPScopes0SubnetMask', 16, N'', N'Subnet mask for the first DHCP Scope', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPServerOptionDNSDomain', 17, N'', N'DNS domain for the DHCP Server Option', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPServerOptionDNSServer', 18, N'', N'DNS Server for the DHCP Server Option', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPServerOptionNBTNodeType', 19, N'', N'NBT Node Type for the DHCP Server Option', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPServerOptionPXEClient', 20, N'', N'PXE Client option for the DHCP Server option', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPServerOptionRouter', 21, N'', N'Routers for the DHCP Server Option', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (12, N'DHCPServerOptionWINSServer', 22, N'', N'WINS Server for the first DHCP Server Option', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'DoNotCreateExtraPartition', 1, N'', N'Specifies that Windows 7 and Windows Server 2008R2 will not create the 300 MB system partition', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDDiskIndex', 2, N'', N'Disk index used for Partitioning (Default is 0)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions', 3, N'', N'Number of Partitions listed here (Default is None, max of 2, use Default configuration)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions0BOOTABLE', 4, N'', N'True/False - is the partition bootable', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions0FILESYSTEM', 5, N'', N'Type of File System (Default: NTFS, can be FAT32)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions0QUICKFORMAT', 6, N'', N'True/False - Shall the format be quick (default: True)', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions0SIZE', 7, N'', N'Size of partition', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions0SIZEUNITS', 8, N'', N'Size units of partition (default: MB, can be GB or percentag)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions0TYPE', 9, N'', N'Type of partition (Default: Primary, can be logical or extended)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions0VOLUMELETTERVARIABLE', 10, N'', N'Variable name to receive DriveLetter', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions0VOLUMENAME', 11, N'', N'Volume Name', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions1BOOTABLE', 12, N'', N'True/False - is the partition bootable (default: True if 1st partition)', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions1FILESYSTEM', 13, N'', N'Type of File System (Default: NTFS, can be FAT32)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions1QUICKFORMAT', 14, N'', N'True/False - Shall the format be quick (default: True)', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions1SIZE', 15, N'', N'Size of partition', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions1SIZEUNITS', 16, N'', N'Size units of partition (default: MB, can be GB or percentag)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions1TYPE', 17, N'', N'Type of partition (Default: Primary, can be logical or extended)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions1VOLUMELETTERVARIABLE', 18, N'', N'Variable name to receive DriveLetter', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (13, N'OSDPartitions1VOLUMENAME', 19, N'', N'Volume Name', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSServerOptionBINDSecondaries', 1, N'', N'Allows BIND secondaries', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSServerOptionDisableRecursion', 2, N'', N'Disables recursion on the DNS server', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSServerOptionEnableNetmaskOrdering', 3, N'', N'Enables netmask ordering', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSServerOptionEnableRoundRobin', 4, N'', N'Enables Round Robin', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSServerOptionEnableSecureCache', 5, N'', N'Enables cache security', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSServerOptionFailOnLoad', 6, N'', N'Toggles fail on load', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSServerOptionNameCheckFlag', 7, N'', N'Name Check Flag', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSZones', 8, N'', N'Number of DNS Zones to Configure', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSZones0DirectoryPartition', 9, N'', N'AD Partition to store the zone', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSZones0FileName', 10, N'', N'File Name of the first DNS Zone', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSZones0MasterIP', 11, N'', N'Primary IP for the zone', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSZones0Name', 12, N'', N'Name of the first DNS Zone', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSZones0Scavenge', 13, N'', N'Enables scavenging', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSZones0Type', 14, N'', N'Type of Zone', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (14, N'DNSZones0Update', 15, N'', N'Enables dynamic updates', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (15, N'ComputerName', 1, N'', N'This variable has been deprecated and should only be used for backwards compatibility', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (15, N'FullName', 2, N'', N'The full name that should be assigned to the computer', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (15, N'OrgName', 3, N'', N'The organization name that should be assigned to the computer', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (15, N'OSDComputerName', 4, N'', N'The new computer name to assign to the computer', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'_SMSTSORGNAME', 1, N'', N'Customizes the Task Sequencer engine display banner', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'AdminPassword', 2, N'', N'Local Administrator password', 0, N'Password', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'ApplicationSuccessCodes', 3, N'', N'Space delimited list of error codes allowed by ZTIApplications.wsf (default: 0 3010)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'BuildID', 4, N'', N'Deprecated, should only be used for backwards compatibility', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'DoCapture', 5, N'', N'Flag to indicate that the machine should be Sysprepped and captured as a new WIM image (default is NO)', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'DriverGroup', 6, N'', N'Specifies the name of the driver group from which drivers should be injected', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'DriverSelectionProfile', 7, N'', N'Profile name used during driver installation', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'EventShare', 8, N'', N'The UNC path where events for the management pack should be placed', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'FinishAction', 9, N'', N'Specifies what action should be taken when a Lite Touch task sequence completes (SHUTDOWN, REBOOT, LOGOFF, or default of none)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'Home_Page', 10, N'', N'Internet Explorer home page', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'OSInstall', 11, N'', N'A flag to indicate that a new OS can be deployed to this computer, set to ''Y'' to authorize', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'OverrideProductKey', 12, N'', N'Override product key', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'PackageSelectionProfile', 13, N'', N'Profile name used during Package installation', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'ProductKey', 14, N'', N'Product key (non-MAK key)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'ResourceRoot', 15, N'', N'Specifies the name of a server to be used during the deployment process for resources like drivers, language packs, and hotfixes. (This should be set for ZTI only.)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'ServerA', 16, N'', N'Specifies the name of a server to be used during the deployment process', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'ServerB', 17, N'', N'Specifies the name of a server to be used during the deployment process', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'ServerC', 18, N'', N'Specifies the name of a server to be used during the deployment process', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'SLShare', 19, N'', N'The UNC path where logs should be copied', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'SLShareDynamicLogging', 20, N'', N'Script log share where all MDT events should be written during execution (advanced debugging only)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'SMSTSRunCommandLineUserName', 21, N'', N'Specifies the username (e.g. DOM\USER) that should be used with a Run Command Line action that is configured to run as user', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'SMSTSRunCommandLineUserPassword', 22, N'', N'Specifies the password that should be used with a Run Command Line action that is configured to run as user', 0, N'Password', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'TaskSequenceID', 23, N'', N'TaskSequenceI ID used to automate LTI task sequence selection (default is blank)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'UserDomain', 24, N'', N'The domain to be used to make network connections', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'UserID', 25, N'', N'The user ID to be used to make network connections', 0, N'Text', NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'UserPassword', 26, N'', N'The password to be used to make network connections', 0, N'Password', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'WDSServer', 27, N'', N'Name of the WDS server that should be used when installing WDS images (default is the server that contains he original image)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'WipeDisk', 28, N'', N'Specifies wether the disk should be wiped (Replace Only)', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'WizardSelectionProfile', 29, N'', N'Profile name used by the wizard for filtering the display of various items', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (16, N'WsusServer', 30, N'', N'The URL of the WSUS server that should be used (optional, will use Windows Update or policy settings by default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0DNSServerList', 1, N'', N'Comma delimited list of DNS Servers', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0DNSSuffix', 2, N'', N'DNS Suffix, example Fabrikam.com', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0EnableDHCP', 3, N'', N'If false, will disable DHCP, otherwise True (True if blank)', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0EnableDNSRegistration', 4, N'', N'True/False to enable DNS registration', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0EnableFullDNSRegistration', 5, N'', N'True/False to enable FULL DNS registration', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0EnableLMHOSTS', 6, N'', N'True/False to enable LMHosts', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0EnableTCPIPFiltering', 7, N'', N'True/False to enable TCP/IP Filtering', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0EnableWINS', 8, N'', N'True/False to enable WINS', 0, N'List', 3)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0GatewayCostMetric', 9, N'', N'Comma delimited list of Gateway Cost Metrics as either integers, or the string Automatic (if empty, uses automatic)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0Gateways', 10, N'', N'Comma delimited list of Gateways', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0IPAddressList', 11, N'', N'Comma delimited list of IP Address Lists', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0IPProtocolFilterList', 12, N'', N'Comma delimited list of IP Protocol Filters', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0MacAddress', 13, N'', N'If present, match all settings to the adapter with this MAC address', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0Name', 14, N'', N'If present, match all settings to the adapter with this MAC address', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0SubnetMask', 15, N'', N'Comma delimited list of Subnet masks', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0TCPFilterPortList', 16, N'', N'Comma delimited list of TCP filters', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0TcpipNetbiosOptions', 17, N'', N'NetBIOS Options 1 or 0', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0UDPFilterPortList', 18, N'', N'Comma delimited list of UDP Filters', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapter0WINSServerList', 19, N'', N'Comma delimited list of WINS Servers', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (17, N'OSDAdapterCount', 20, N'', N'Number of Adapters defined here (either blank, 0 or 1)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (18, N'AutoMode', 1, N'', N'Sets AutoMode for Server 2003 deployments', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (18, N'AutoUsers', 2, N'', N'Sets Auto Users for Server 2003 deployments', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (18, N'OSFeatures', 3, N'', N'Comma delimited list of features to be installed', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (18, N'OSRoles', 4, N'', N'Comma delimited list of role IDs to be installed', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (19, N'AreaCode', 1, N'', N'Area code for the computer''s location', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (19, N'CountryCode', 2, N'', N'Country or region code to use for telephony', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (19, N'Dialing', 3, N'', N'Type of dialing to use for the telephony device in the computer, such as ''Tone'' or ''Pulse'' (XP only)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (19, N'InputLocale', 4, N'', N'Locale used for keyboard, e.g. 0409:00000409 (XP only, default is OS default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (19, N'KeyboardLocale', 5, N'', N'Locale used for Keyboard, can be either 0409:00000409 or en-US format (Vista only, default is OS Default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (19, N'LongDistanceAccess', 6, N'', N'Number to dial to gain access to an outside line, such as 9', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (19, N'SystemLocale', 7, N'', N'Locale used for System (default is OS default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (19, N'TimeZone', 8, N'', N'The time zone identifier that should be used for the computer (XP only)', 0, N'List', 4)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (19, N'TimeZoneName', 9, N'', N'The time zone identifier that should be used for the computer (Vista only)', 0, N'List', 5)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (19, N'UILanguage', 10, N'', N'Default language used for OS before user is logged in, en-US format (default is OS Default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (19, N'UserLocale', 11, N'', N'Locale used for Keyboard, can be either 0409:00000409 or en-US format (default is OS Default)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'BackupDir', 1, N'', N'Directory on the network share where the computer backup should be stored', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'BackupFile', 2, N'', N'Sets the name of the backup file used with ztibackup', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'BackupShare', 3, N'', N'Network share (UNC) where the computer backup should be stored', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'CaptureGroups', 4, N'', N'Specifies wether to capture the local group membership from the machine (default is YES; ALL can also be specified)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'ComputerBackupLocation', 5, N'', N'Specifies where the computer backup should be stored (AUTO, NETWORK, NONE, specific path, default is AUTO)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'LoadStateArgs', 6, N'', N'Command line arguments for USMT Loadstate', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'ScanStateArgs', 7, N'', N'Command line arguments for USMT Scanstate', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'UDDir', 8, N'', N'The directory that should be created to contain the user data', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'UDProfiles', 9, N'', N'A list of comma-separated username that should be captured', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'UDShare', 10, N'', N'The UNC path where user data should be stored', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'UserDataLocation', 11, N'', N'Specifies where the user data should be stored (AUTO, NETWORK, NONE, specific Path, default is AUTO)', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'USMT3', 12, N'', N'Designates to always use USMT 3. Valid values are YES or NO', 0, N'List', 1)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (20, N'USMTConfigFile', 13, N'', N'USMT configuration XML file that should be used when running Scanstate and Loadstate', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (21, N'DestinationDisk', 1, N'', N'Disk number that the image will be deployed to', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (21, N'DestinationPartition', 2, N'', N'Disk partition that the image will be deployed to.', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (21, N'OSRoleServices', 3, N'', N'A comma-delimited list of server role service IDs that will be installed on the target computer.', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (22, N'OSDComputerName', 1, N'Computername', N'Computername', 0, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (22, N'SLShare', 3, N'Log Share', N'The UNC path where logs should be copied', 1, N'Text', NULL)
INSERT [dbo].[Settings_Categories] ([CategoryID], [Column_Name], [Sequence], [Name], [Description], [ReadOnly], [Type], [ListID]) VALUES (22, N'UDDir', 2, N'User Data Folder', N'Specifies where the user data should be stored (AUTO, NETWORK, NONE, specific Path, default is AUTO)', 0, N'Text', NULL)


/* ------------------------------------------------------------------------ */
/* Create Users_AccessRoles table                                           */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_AccessRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users_AccessRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[AccessRoleID] [int] NULL,
	[Instance] [int] NULL,
 CONSTRAINT [PK_Users_AccessRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
) 
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_AccessRoles_AccessRoles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users_AccessRoles]'))
ALTER TABLE [dbo].[Users_AccessRoles]  WITH CHECK ADD  CONSTRAINT [FK_Users_AccessRoles_AccessRoles] FOREIGN KEY([AccessRoleID])
REFERENCES [dbo].[AccessRoles] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_AccessRoles_AccessRoles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users_AccessRoles]'))
ALTER TABLE [dbo].[Users_AccessRoles] CHECK CONSTRAINT [FK_Users_AccessRoles_AccessRoles]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_AccessRoles_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users_AccessRoles]'))
ALTER TABLE [dbo].[Users_AccessRoles]  WITH CHECK ADD  CONSTRAINT [FK_Users_AccessRoles_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_AccessRoles_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users_AccessRoles]'))
ALTER TABLE [dbo].[Users_AccessRoles] CHECK CONSTRAINT [FK_Users_AccessRoles_Users]
GO


/* ------------------------------------------------------------------------ */
/* Create RoleMapping table                                                 */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RoleMapping](
	[RoleID] [int] NOT NULL,
	[ARPName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_RoleMapping] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[ARPName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO


/* ------------------------------------------------------------------------ */
/* Create ListEntries table                                                 */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListEntries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ListEntries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ListID] [int] NULL,
	[Text] [nvarchar](255) NULL,
	[Value] [nvarchar](255) NULL,
	[Sequence] [int] NULL,
 CONSTRAINT [PK_ListEntries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ListEntries_Lists]') AND parent_object_id = OBJECT_ID(N'[dbo].[ListEntries]'))
ALTER TABLE [dbo].[ListEntries]  WITH CHECK ADD  CONSTRAINT [FK_ListEntries_Lists] FOREIGN KEY([ListID])
REFERENCES [dbo].[Lists] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ListEntries_Lists]') AND parent_object_id = OBJECT_ID(N'[dbo].[ListEntries]'))
ALTER TABLE [dbo].[ListEntries] CHECK CONSTRAINT [FK_ListEntries_Lists]
GO

/* ------------------------------------------------------------------------ */
/* Add default entries to table                                             */
/* ------------------------------------------------------------------------ */

SET IDENTITY_INSERT [dbo].[ListEntries] ON
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (1, 1, N'Yes', N'YES', 1)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (2, 1, N'No', N'NO', 2)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (3, 2, N'Yes', N'YES', 1)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (4, 2, N'No', N'NO', 2)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (5, 2, N'All', N'ALL', 3)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (6, 3, N'True', N'TRUE', 1)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (7, 3, N'False', N'FALSE', 2)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (8, 4, N'(GMT-12:00) International Date Line West', N'0', 1)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (9, 4, N'(GMT-11:00) Midway Island, Samoa', N'1', 2)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (10, 4, N'(GMT-10:00) Hawaii', N'2', 3)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (11, 4, N'(GMT-09:00) Alaska', N'3', 4)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (12, 4, N'(GMT-08:00) Pacific Time (US and Canada); Tijuana', N'4', 5)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (13, 4, N'(GMT-07:00) Mountain Time (US and Canada)', N'10', 6)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (14, 4, N'(GMT-07:00) Chihuahua, La Paz, Mazatlan', N'13', 7)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (15, 4, N'(GMT-07:00) Arizona', N'15', 8)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (16, 4, N'(GMT-06:00) Central Time (US and Canada)', N'20', 9)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (17, 4, N'(GMT-06:00) Saskatchewan', N'25', 10)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (18, 4, N'(GMT-06:00) Guadalajara, Mexico City, Monterrey', N'30', 11)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (19, 4, N'(GMT-06:00) Central America', N'33', 12)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (20, 4, N'(GMT-05:00) Eastern Time (US and Canada)', N'35', 13)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (21, 4, N'(GMT-05:00) Indiana (East)', N'40', 14)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (22, 4, N'(GMT-05:00) Bogota, Lima, Quito', N'45', 15)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (23, 4, N'(GMT-04:00) Atlantic Time (Canada)', N'50', 16)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (24, 4, N'(GMT-04:00) Caracas, La Paz', N'55', 17)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (25, 4, N'(GMT-04:00) Santiago', N'56', 18)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (26, 4, N'(GMT-03:30) Newfoundland and Labrador', N'60', 19)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (27, 4, N'(GMT-03:00) Brasilia', N'65', 20)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (28, 4, N'(GMT-03:00) Buenos Aires, Georgetown', N'70', 21)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (29, 4, N'(GMT-03:00) Greenland', N'73', 22)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (30, 4, N'(GMT-02:00) Mid-Atlantic', N'75', 23)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (31, 4, N'(GMT-01:00) Azores', N'80', 24)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (32, 4, N'(GMT-01:00) Cape Verde Islands', N'83', 25)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (33, 4, N'(GMT) Greenwich Mean Time : Dublin, Edinburgh, Lisbon, London', N'85', 26)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (34, 4, N'(GMT) Casablanca, Monrovia', N'90', 27)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (35, 4, N'(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague', N'95', 28)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (36, 4, N'(GMT+01:00) Sarajevo, Skopje, Warsaw, Zagreb', N'100', 29)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (37, 4, N'(GMT+01:00) Brussels, Copenhagen, Madrid, Paris', N'105', 30)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (38, 4, N'(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna', N'110', 31)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (39, 4, N'(GMT+01:00) West Central Africa', N'113', 32)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (40, 4, N'(GMT+02:00) Bucharest', N'115', 33)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (41, 4, N'(GMT+02:00) Cairo', N'120', 34)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (42, 4, N'(GMT+02:00) Helsinki, Kiev, Riga, Sofia, Tallinn, Vilnius', N'125', 35)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (43, 4, N'(GMT+02:00) Athens, Istanbul, Minsk', N'130', 36)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (44, 4, N'(GMT+02:00) Jerusalem', N'135', 37)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (45, 4, N'(GMT+02:00) Harare, Pretoria', N'140', 38)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (46, 4, N'(GMT+03:00) Moscow, St. Petersburg, Volgograd', N'145', 39)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (47, 4, N'(GMT+03:00) Kuwait, Riyadh', N'150', 40)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (48, 4, N'(GMT+03:00) Nairobi', N'155', 41)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (49, 4, N'(GMT+03:00) Baghdad', N'158', 42)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (50, 4, N'(GMT+03:30) Tehran', N'160', 43)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (51, 4, N'(GMT+04:00) Abu Dhabi, Muscat', N'165', 44)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (52, 4, N'(GMT+04:00) Baku, Tbilisi, Yerevan', N'170', 45)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (53, 4, N'(GMT+04:30) Kabul', N'175', 46)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (54, 4, N'(GMT+05:00) Ekaterinburg', N'180', 47)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (55, 4, N'(GMT+05:00) Islamabad, Karachi, Tashkent', N'185', 48)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (56, 4, N'(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi', N'190', 49)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (57, 4, N'(GMT+05:45) Kathmandu', N'193', 50)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (58, 4, N'(GMT+06:00) Astana, Dhaka', N'195', 51)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (59, 4, N'(GMT+06:00) Sri Jayawardenepura', N'200', 52)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (60, 4, N'(GMT+06:00) Almaty, Novosibirsk', N'201', 53)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (61, 4, N'(GMT+06:30) Yangon (Rangoon)', N'203', 54)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (62, 4, N'(GMT+07:00) Bangkok, Hanoi, Jakarta', N'205', 55)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (63, 4, N'(GMT+07:00) Krasnoyarsk', N'207', 56)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (64, 4, N'(GMT+08:00) Beijing, Chongqing, Hong Kong SAR, Urumqi', N'210', 57)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (65, 4, N'(GMT+08:00) Kuala Lumpur, Singapore', N'215', 58)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (66, 4, N'(GMT+08:00) Taipei', N'220', 59)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (67, 4, N'(GMT+08:00) Perth', N'225', 60)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (68, 4, N'(GMT+08:00) Irkutsk, Ulaanbaatar', N'227', 61)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (69, 4, N'(GMT+09:00) Seoul', N'230', 62)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (70, 4, N'(GMT+09:00) Osaka, Sapporo, Tokyo', N'235', 63)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (71, 4, N'(GMT+09:00) Yakutsk', N'240', 64)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (72, 4, N'(GMT+09:30) Darwin', N'245', 65)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (73, 4, N'(GMT+09:30) Adelaide', N'250', 66)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (74, 4, N'(GMT+10:00) Canberra, Melbourne, Sydney', N'255', 67)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (75, 4, N'(GMT+10:00) Brisbane', N'260', 68)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (76, 4, N'(GMT+10:00) Hobart', N'265', 69)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (77, 4, N'(GMT+10:00) Vladivostok', N'270', 70)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (78, 4, N'(GMT+10:00) Guam, Port Moresby', N'275', 71)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (79, 4, N'(GMT+11:00) Magadan, Solomon Islands, New Caledonia', N'280', 72)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (80, 4, N'(GMT+12:00) Fiji Islands, Kamchatka, Marshall Islands', N'285', 73)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (81, 4, N'(GMT+12:00) Auckland, Wellington', N'290', 74)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (82, 4, N'(GMT+13:00) Nuku''alofa', N'300', 75)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (83, 5, N'(GMT-12:00) International Date Line West', N'Dateline Standard Time', 1)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (84, 5, N'(GMT-11:00) Midway Island, Samoa', N'Samoa Standard Time', 2)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (85, 5, N'(GMT-10:00) Hawaii', N'Hawaiian Standard Time', 3)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (86, 5, N'(GMT-09:00) Alaska', N'Alaskan Standard Time', 4)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (87, 5, N'(GMT-08:00) Pacific Time (US and Canada); Tijuana', N'Pacific Standard Time', 5)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (88, 5, N'(GMT-07:00) Mountain Time (US and Canada)', N'Mountain Standard Time', 6)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (89, 5, N'(GMT-07:00) Chihuahua, La Paz, Mazatlan', N'Mexico Standard Time 2', 7)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (90, 5, N'(GMT-07:00) Arizona', N'US Mountain Standard Time', 8)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (91, 5, N'(GMT-06:00) Central Time (US and Canada)', N'Central Standard Time', 9)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (92, 5, N'(GMT-06:00) Saskatchewan', N'Canada Central Standard Time', 10)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (93, 5, N'(GMT-06:00) Guadalajara, Mexico City, Monterrey', N'Mexico Standard Time', 11)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (94, 5, N'(GMT-06:00) Central America', N'Central America Standard Time', 12)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (95, 5, N'(GMT-05:00) Eastern Time (US and Canada)', N'Eastern Standard Time', 13)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (96, 5, N'(GMT-05:00) Indiana (East)', N'US Eastern Standard Time', 14)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (97, 5, N'(GMT-05:00) Bogota, Lima, Quito', N'SA Pacific Standard Time', 15)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (98, 5, N'(GMT-04:00) Atlantic Time (Canada)', N'Atlantic Standard Time', 16)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (99, 5, N'(GMT-04:00) Caracas, La Paz', N'SA Western Standard Time', 17)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (100, 5, N'(GMT-04:00) Santiago', N'Pacific SA Standard Time', 18)
GO
print 'Processed 100 total records'
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (101, 5, N'(GMT-03:30) Newfoundland and Labrador', N'Newfoundland Standard Time', 19)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (102, 5, N'(GMT-03:00) Brasilia', N'E. South America Standard Time', 20)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (103, 5, N'(GMT-03:00) Buenos Aires, Georgetown', N'SA Eastern Standard Time', 21)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (104, 5, N'(GMT-03:00) Greenland', N'Greenland Standard Time', 22)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (105, 5, N'(GMT-02:00) Mid-Atlantic', N'Mid-Atlantic Standard Time', 23)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (106, 5, N'(GMT-01:00) Azores', N'Azores Standard Time', 24)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (107, 5, N'(GMT-01:00) Cape Verde Islands', N'Cape Verde Standard Time', 25)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (108, 5, N'(GMT) Greenwich Mean Time : Dublin, Edinburgh, Lisbon, London', N'GMT Standard Time', 26)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (109, 5, N'(GMT) Casablanca, Monrovia', N'Greenwich Standard Time', 27)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (110, 5, N'(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague', N'Central Europe Standard Time', 28)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (111, 5, N'(GMT+01:00) Sarajevo, Skopje, Warsaw, Zagreb', N'Central European Standard Time', 29)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (112, 5, N'(GMT+01:00) Brussels, Copenhagen, Madrid, Paris', N'Romance Standard Time', 30)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (113, 5, N'(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna', N'W. Europe Standard Time', 31)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (114, 5, N'(GMT+01:00) West Central Africa', N'W. Central Africa Standard Time', 32)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (115, 5, N'(GMT+02:00) Bucharest', N'E. Europe Standard Time', 33)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (116, 5, N'(GMT+02:00) Cairo', N'Egypt Standard Time', 34)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (117, 5, N'(GMT+02:00) Helsinki, Kiev, Riga, Sofia, Tallinn, Vilnius', N'FLE Standard Time', 35)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (118, 5, N'(GMT+02:00) Athens, Istanbul, Minsk', N'GTB Standard Time', 36)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (119, 5, N'(GMT+02:00) Jerusalem', N'Israel Standard Time', 37)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (120, 5, N'(GMT+02:00) Harare, Pretoria', N'South Africa Standard Time', 38)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (121, 5, N'(GMT+03:00) Moscow, St. Petersburg, Volgograd', N'Russian Standard Time', 39)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (122, 5, N'(GMT+03:00) Kuwait, Riyadh', N'Arab Standard Time', 40)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (123, 5, N'(GMT+03:00) Nairobi', N'E. Africa Standard Time', 41)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (124, 5, N'(GMT+03:00) Baghdad', N'Arabic Standard Time', 42)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (125, 5, N'(GMT+03:30) Tehran', N'Iran Standard Time', 43)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (126, 5, N'(GMT+04:00) Abu Dhabi, Muscat', N'Arabian Standard Time', 44)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (127, 5, N'(GMT+04:00) Baku, Tbilisi, Yerevan', N'Caucasus Standard Time', 45)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (128, 5, N'(GMT+04:30) Kabul', N'Afghanistan Standard Time', 46)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (129, 5, N'(GMT+05:00) Ekaterinburg', N'Ekaterinburg Standard Time', 47)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (130, 5, N'(GMT+05:00) Islamabad, Karachi, Tashkent', N'West Asia Standard Time', 48)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (131, 5, N'(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi', N'India Standard Time', 49)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (132, 5, N'(GMT+05:45) Kathmandu', N'Nepal Standard Time', 50)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (133, 5, N'(GMT+06:00) Astana, Dhaka', N'Central Asia Standard Time', 51)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (134, 5, N'(GMT+06:00) Sri Jayawardenepura', N'Sri Lanka Standard Time', 52)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (135, 5, N'(GMT+06:00) Almaty, Novosibirsk', N'N. Central Asia Standard Time', 53)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (136, 5, N'(GMT+06:30) Yangon (Rangoon)', N'Myanmar Standard Time', 54)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (137, 5, N'(GMT+07:00) Bangkok, Hanoi, Jakarta', N'SE Asia Standard Time', 55)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (138, 5, N'(GMT+07:00) Krasnoyarsk', N'North Asia Standard Time', 56)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (139, 5, N'(GMT+08:00) Beijing, Chongqing, Hong Kong SAR, Urumqi', N'China Standard Time', 57)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (140, 5, N'(GMT+08:00) Kuala Lumpur, Singapore', N'Singapore Standard Time', 58)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (141, 5, N'(GMT+08:00) Taipei', N'Taipei Standard Time', 59)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (142, 5, N'(GMT+08:00) Perth', N'W. Australia Standard Time', 60)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (143, 5, N'(GMT+08:00) Irkutsk, Ulaanbaatar', N'North Asia East Standard Time', 61)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (144, 5, N'(GMT+09:00) Seoul', N'Korea Standard Time', 62)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (145, 5, N'(GMT+09:00) Osaka, Sapporo, Tokyo', N'Tokyo Standard Time', 63)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (146, 5, N'(GMT+09:00) Yakutsk', N'Yakutsk Standard Time', 64)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (147, 5, N'(GMT+09:30) Darwin', N'AUS Central Standard Time', 65)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (148, 5, N'(GMT+09:30) Adelaide', N'Cen. Australia Standard Time', 66)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (149, 5, N'(GMT+10:00) Canberra, Melbourne, Sydney', N'AUS Eastern Standard Time', 67)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (150, 5, N'(GMT+10:00) Brisbane', N'E. Australia Standard Time', 68)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (151, 5, N'(GMT+10:00) Hobart', N'Tasmania Standard Time', 69)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (152, 5, N'(GMT+10:00) Vladivostok', N'Vladivostok Standard Time', 70)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (153, 5, N'(GMT+10:00) Guam, Port Moresby', N'West Pacific Standard Time', 71)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (154, 5, N'(GMT+11:00) Magadan, Solomon Islands, New Caledonia', N'Central Pacific Standard Time', 72)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (155, 5, N'(GMT+12:00) Fiji Islands, Kamchatka, Marshall Islands', N'Fiji Islands Standard Time', 73)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (156, 5, N'(GMT+12:00) Auckland, Wellington', N'New Zealand Standard Time', 74)
INSERT [dbo].[ListEntries] ([ID], [ListID], [Text], [Value], [Sequence]) VALUES (157, 5, N'(GMT+13:00) Nuku''alofa', N'Tonga Standard Time', 75)
SET IDENTITY_INSERT [dbo].[ListEntries] OFF


/* ------------------------------------------------------------------------ */
/* Create Applications table                                                */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Applications](
	[ApplicationID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ShortName] [nvarchar](255) NULL,
	[Version] [nvarchar](255) NULL,
	[Publisher] [nvarchar](255) NULL,
	[Language] [nvarchar](255) NULL,
	[CommandLine] [nvarchar](255) NULL,
	[WorkingDirectory] [nvarchar](255) NULL,
	[enable] [bit] NULL,
	[hide] [bit] NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO


SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS ON
GO



/* ------------------------------------------------------------------------ */
/* Create Views                                                             */
/* ------------------------------------------------------------------------ */


/* ------------------------------------------------------------------------ */
/* Create AccessRoleAssignments view                                        */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AccessRoleAssignments]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[AccessRoleAssignments]
AS
SELECT     TOP (100) PERCENT dbo.Users_AccessRoles.ID AS AssignmentId, dbo.Users_AccessRoles.UserID, dbo.Users.Username, dbo.Users.Lastname, dbo.Users.Firstname, 
                      dbo.Users_AccessRoles.AccessRoleID, dbo.AccessRoles.Name AS AccessRoleName, dbo.Users_AccessRoles.Instance AS InstanceID, 
                      CASE dbo.AccessRoles.Type WHEN ''C'' THEN
                          (SELECT     Description
                            FROM          ComputerIdentity
                            WHERE      ID = dbo.Users_AccessRoles.Instance) WHEN ''L'' THEN
                          (SELECT     Location
                            FROM          LocationIdentity
                            WHERE      ID = dbo.Users_AccessRoles.Instance) WHEN ''M'' THEN
                          (SELECT     Make + Model
                            FROM          MakeModelIdentity
                            WHERE      ID = dbo.Users_AccessRoles.Instance) WHEN ''R'' THEN
                          (SELECT     Role
                            FROM          RoleIdentity
                            WHERE      ID = dbo.Users_AccessRoles.Instance) WHEN ''A'' THEN ''All'' ELSE ''Error'' END AS InstanceName
FROM         dbo.AccessRoles INNER JOIN
                      dbo.Users_AccessRoles ON dbo.AccessRoles.ID = dbo.Users_AccessRoles.AccessRoleID LEFT OUTER JOIN
                      dbo.Users ON dbo.Users_AccessRoles.UserID = dbo.Users.ID
ORDER BY dbo.Users.Lastname, InstanceName, InstanceID

'
GO


/* ------------------------------------------------------------------------ */
/* Create RoleMappings view                                                 */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RoleMappings]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[RoleMappings]
AS
SELECT     dbo.RoleIdentity.ID, dbo.RoleIdentity.Role, dbo.RoleMapping.ARPName
FROM         dbo.RoleIdentity INNER JOIN
                      dbo.RoleMapping ON dbo.RoleIdentity.ID = dbo.RoleMapping.RoleID

'
GO


/* ------------------------------------------------------------------------ */
/* Create ApplicationAssignments view                                       */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationAssignments]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ApplicationAssignments]
AS
SELECT     Type, ID, Sequence, Applications, CASE dbo.Settings_Applications.Type WHEN ''C'' THEN
                          (SELECT     Description
                            FROM          ComputerIdentity
                            WHERE      ID = dbo.Settings_Applications.ID) WHEN ''L'' THEN
                          (SELECT     Location
                            FROM          LocationIdentity
                            WHERE      ID = dbo.Settings_Applications.ID) WHEN ''M'' THEN
                          (SELECT     Make + '' '' + Model
                            FROM          MakeModelIdentity
                            WHERE      ID = dbo.Settings_Applications.ID) WHEN ''R'' THEN
                          (SELECT     Role
                            FROM          RoleIdentity
                            WHERE      ID = dbo.Settings_Applications.ID) END AS Instance
FROM         dbo.Settings_Applications
' 
GO


/* ------------------------------------------------------------------------ */
/* Create PackageAssignments view                                           */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PackageAssignments]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[PackageAssignments]
AS
SELECT     Type, ID, Sequence, Packages, CASE dbo.Settings_Packages.Type WHEN ''C'' THEN
                          (SELECT     Description
                            FROM          ComputerIdentity
                            WHERE      ID = dbo.Settings_Packages.ID) WHEN ''L'' THEN
                          (SELECT     Location
                            FROM          LocationIdentity
                            WHERE      ID = dbo.Settings_Packages.ID) WHEN ''M'' THEN
                          (SELECT     Make + '' '' + Model
                            FROM          MakeModelIdentity
                            WHERE      ID = dbo.Settings_Packages.ID) WHEN ''R'' THEN
                          (SELECT     Role
                            FROM          RoleIdentity
                            WHERE      ID = dbo.Settings_Packages.ID) END AS Instance
FROM         dbo.Settings_Packages
' 
GO


/* ------------------------------------------------------------------------ */
/* Create AdministratorAssignments view                                     */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AdministratorAssignments]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[AdministratorAssignments]
AS
SELECT     Type, ID, Sequence, Administrators, CASE dbo.Settings_Administrators.Type WHEN ''C'' THEN
                          (SELECT     Description
                            FROM          ComputerIdentity
                            WHERE      ID = dbo.Settings_Administrators.ID) WHEN ''L'' THEN
                          (SELECT     Location
                            FROM          LocationIdentity
                            WHERE      ID = dbo.Settings_Administrators.ID) WHEN ''M'' THEN
                          (SELECT     Make + '' '' + Model
                            FROM          MakeModelIdentity
                            WHERE      ID = dbo.Settings_Administrators.ID) WHEN ''R'' THEN
                          (SELECT     Role
                            FROM          RoleIdentity
                            WHERE      ID = dbo.Settings_Administrators.ID) END AS Instance
FROM         dbo.Settings_Administrators
' 
GO


/* ------------------------------------------------------------------------ */
/* Create RoleAssignments view                                              */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RoleAssignments]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[RoleAssignments]
AS
SELECT     Type, ID, Sequence, Role, CASE dbo.Settings_Roles.Type WHEN ''C'' THEN
                          (SELECT     Description
                            FROM          ComputerIdentity
                            WHERE      ID = dbo.Settings_Roles.ID) WHEN ''L'' THEN
                          (SELECT     Location
                            FROM          LocationIdentity
                            WHERE      ID = dbo.Settings_Roles.ID) WHEN ''M'' THEN
                          (SELECT     Make + '' '' + Model
                            FROM          MakeModelIdentity
                            WHERE      ID = dbo.Settings_Roles.ID) WHEN ''R'' THEN
                          (SELECT     Role
                            FROM          RoleIdentity
                            WHERE      ID = dbo.Settings_Roles.ID) END AS Instance
FROM         dbo.Settings_Roles
' 
GO



/* ------------------------------------------------------------------------ */
/* Create Stored Procedures                                                 */
/* ------------------------------------------------------------------------ */


/* ------------------------------------------------------------------------ */
/* Create SetSetting stored procedure                                       */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetSetting]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Koster, Maik
-- Description:	Updates a Setting 
-- =============================================
CREATE PROCEDURE [dbo].[SetSetting] 
	@MDTID as int,
	@Setting as nvarchar(50),
	@Value as nvarchar(255),
	@Type as nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	/* First we need to check if the Requested Value exists */
	IF EXISTS (SELECT * FROM syscolumns c INNER JOIN sysobjects o ON c.id = o.id 
			   WHERE o.name LIKE ''Settings'' AND c.name LIKE @Setting)
		BEGIN

		/* Do some manipulation on the Type */
		IF LEN(@Type) > 0
			SET @Type = UPPER(LEFT(@Type,1))
		ELSE
			SET @Type = ''C''

		/* Declare additional variables */
		DECLARE @Query as nvarchar(500)
		DECLARE @ParameterDefinition AS NVARCHAR(100)

		/* Prepare the update statement */
		SET @Query = ''UPDATE dbo.Settings SET '' + @Setting + '' = '''''' + @Value + '''''' WHERE [Type] = '''''' + @Type + '''''' AND ID = @MDTID''
		SET @ParameterDefinition = ''@MDTID INT''
		
		/* Execute the update statement including the parameter definition for the MDTID */
		EXECUTE sp_executesql @Query, @ParameterDefinition, @MDTID

		END
	ELSE
		/* Requested value does not exist. Return -1 */
		RETURN -1
END
' 
END
GO


/* ------------------------------------------------------------------------ */
/* Create GetSettings stored procedure                                      */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Koster, Maik
-- Description:	Returns a list of all available Settings from the Settings Table
-- =============================================
CREATE PROCEDURE [dbo].[GetSettings]

AS
BEGIN
	SET NOCOUNT ON;

	SELECT column_name
	FROM information_schema.columns
	WHERE table_name = ''Settings'' AND
			column_name NOT IN (''Type'', ''ID'')
	ORDER BY column_name
END
' 
END
GO


/* ------------------------------------------------------------------------ */
/* Create CreateCustomSetting stored procedure                              */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreateCustomSetting]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- ================================================================
-- Author:	Koster, Maik
-- Description:	Creates a new Custom Setting in the Settings Table
-- ================================================================
CREATE PROCEDURE [dbo].[CreateCustomSetting] 
	@SettingName nvarchar(250)
	
AS
BEGIN
	SET NOCOUNT ON;

	IF @SettingName <> '''' And NOT EXISTS (
		SELECT * FROM information_schema.COLUMNS
		WHERE column_name=@SettingName
			AND table_name = ''Settings''
		)
		BEGIN
			DECLARE @SQL nvarchar(500)
		
			SET @SQL = ''ALTER TABLE [dbo].[Settings] ADD ['' + @SettingName + ''] [nvarchar] (255) NULL DEFAULT('''''''')''
			EXEC(@SQL)
			
			SET @SQL = ''UPDATE [dbo].[Settings] SET ['' + @SettingName + ''] = '''''''' WHERE ['' + @SettingName + ''] IS NULL''
			EXEC(@SQL)
			
			-- Update Views
			-- ComputerSettings
			DECLARE @ViewDef VARCHAR(max)
			SET @ViewDef = (
				SELECT DEFINITION
				FROM sys.sql_modules
				WHERE object_id = object_id(''dbo.ComputerSettings'')
			)
		
			IF @ViewDef is null
				RETURN 
			DECLARE @CREATE_LOC int
			SET @CREATE_LOC = CHARINDEX(N''CREATE'',@ViewDef)
			SET @ViewDef = STUFF(@ViewDef,@CREATE_LOC,6,N''ALTER'')

			EXEC (@ViewDef)
			
			-- LocationSettings
			SET @ViewDef = (
				SELECT DEFINITION
				FROM sys.sql_modules
				WHERE object_id = object_id(''dbo.LocationSettings'')
			)
		
			IF @ViewDef is null
				RETURN 
				
			SET @CREATE_LOC = CHARINDEX(N''CREATE'',@ViewDef)
			SET @ViewDef = STUFF(@ViewDef,@CREATE_LOC,6,N''ALTER'')
				
			EXEC (@ViewDef)
			
			-- MakeModelSettings
			SET @ViewDef = (
				SELECT DEFINITION
				FROM sys.sql_modules
				WHERE object_id = object_id(''dbo.MakeModelSettings'')
			)
		
			IF @ViewDef is null
				RETURN 

			SET @CREATE_LOC = CHARINDEX(N''CREATE'',@ViewDef)
			SET @ViewDef = STUFF(@ViewDef,@CREATE_LOC,6,N''ALTER'')
				
			EXEC (@ViewDef)
			
			-- RoleSettings
			SET @ViewDef = (
				SELECT DEFINITION
				FROM sys.sql_modules
				WHERE object_id = object_id(''dbo.RoleSettings'')
			)
		
			IF @ViewDef is null
				RETURN 

			SET @CREATE_LOC = CHARINDEX(N''CREATE'',@ViewDef)
			SET @ViewDef = STUFF(@ViewDef,@CREATE_LOC,6,N''ALTER'')
				
			EXEC (@ViewDef)
		END
END
' 
END
GO


/* ------------------------------------------------------------------------ */
/* Create RetrieveRoles stored procedure                                    */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RetrieveRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE  PROCEDURE [dbo].[RetrieveRoles]
@MacAddress CHAR(17)
AS

  SET NOCOUNT ON

  /* Select and return all the appropriate records based on current inventory */
  SELECT * FROM RoleMappings
  WHERE ARPName IN
  (
    SELECT ProdID0 FROM SMS_SMS.dbo.v_GS_ADD_REMOVE_PROGRAMS a, SMS_SMS.dbo.v_GS_NETWORK_ADAPTER n
    WHERE a.ResourceID = n.ResourceID AND
    MACAddress0 = @MacAddress
  )
' 
END
GO


/* ------------------------------------------------------------------------ */
/* Create RetrievePackage stored procedure                                  */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RetrievePackages]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'  CREATE  PROCEDURE [dbo].[RetrievePackages] @MacAddress CHAR(17) AS    SET NOCOUNT ON    /* Select and return all the appropriate records based on current inventory */   SELECT * FROM PackageMapping   WHERE ARPName IN   (     SELECT ProdID0 FROM SMS_SMS.dbo.v_GS_ADD_REMOVE_PROGRAMS a, SMS_SMS.dbo.v_GS_NETWORK_ADAPTER n     WHERE a.ResourceID = n.ResourceID AND     MACAddress0 = @MacAddress   )' 
END
GO


/* ------------------------------------------------------------------------ */
/* Create AddDefaultSettings stored procedure                               */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddDefaultSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Koster, Maik
-- Description:	Ensures that a set of settings exist
--              for an object to avoid NULL problems
-- =============================================
CREATE PROCEDURE [dbo].[AddDefaultSettings]
	@MDTID as int,
	@Type as nvarchar(50) 
AS
BEGIN
	SET NOCOUNT ON;

	/* Do some manipulation on the Type */
	IF LEN(@Type) > 0
		SET @Type = UPPER(LEFT(@Type,1))
	ELSE
		SET @Type = ''C''

	/* Just add an "empty" Settings entry to the Settings table to be used later */
	IF NOT EXISTS (SELECT * FROM dbo.Settings WHERE ID = @MDTID AND [Type] = @Type)
		BEGIN
		INSERT INTO dbo.Settings
		(ID, [Type])
		VALUES
		(@MDTID, @Type)
		END
END
' 
END
GO


/* ------------------------------------------------------------------------ */
/* Create GetSettingsAsRows stored procedure                                */
/* ------------------------------------------------------------------------ */

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetSettingsAsRows]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Koster, Maik
-- Description:	returns a list of settings as rows
-- =============================================
CREATE PROCEDURE [dbo].[GetSettingsAsRows]
	-- Add the parameters for the stored procedure here
	@ID as int,
	@Type as char,
	@GroupID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/* Ensure a Settings entry exists */
	EXECUTE dbo.AddDefaultSettings @ID, @Type

	SELECT  newid() as ID,
		dbo.Groups.[Name] AS [Group], 
		dbo.Categories.[Name] AS Category,
		dbo.Settings_Categories.[Name] AS [Name], 
		dbo.Settings_Categories.[Column_Name],
		cv.[Column_Value], 
		dbo.Settings_Categories.[Type] AS [Column_Type],
		dbo.Lists.[Name] AS [Column_List],
		dbo.Settings_Categories.[Description], 
		dbo.Settings_Categories.[ReadOnly],
		dbo.Settings_Categories.[ListID]
	FROM    dbo.Lists RIGHT OUTER JOIN dbo.Settings_Categories ON dbo.Lists.ID = dbo.Settings_Categories.ListID INNER JOIN
        dbo.Categories ON dbo.Settings_Categories.CategoryID = dbo.Categories.ID INNER JOIN
        dbo.Categories_Groups ON dbo.Categories.ID = dbo.Categories_Groups.CategoryID INNER JOIN
        dbo.Groups ON dbo.Categories_Groups.GroupID = dbo.Groups.ID INNER JOIN 

		(SELECT t.c.value(''local-name(.)'', ''NVARCHAR(250)'') as [Column_Name]
				,t.c.value(''.'', ''NVARCHAR(250)'') as [Column_Value] 
		 FROM 
			(SELECT 
				(SELECT t.* FOR XML RAW, TYPE) as x 
				 FROM dbo.Settings t 
				 WHERE ID = @ID AND Type = @Type
				 )v 
			CROSS APPLY v.x.nodes(''row/@*'') AS t(c) 
		) AS cv ON dbo.Settings_Categories.Column_Name = cv.Column_Name
WHERE     (dbo.Categories_Groups.GroupID = @GroupID)
ORDER BY dbo.Categories_Groups.Sequence, dbo.Settings_Categories.Sequence
END
' 
END
GO
