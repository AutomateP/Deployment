SELECT [cn] AS 'Computer Name'
      ,[ObjectPath] AS 'Path'
      ,[operatingSystem] AS 'OS'
      ,[operatingSystemServicePack] AS 'SP'
      ,[LastLogon] 
      ,DATEDIFF(dd, [LastLogon], getdate()) AS 'days LastLogon'
      ,[PwdLastSet]
      ,DATEDIFF(dd, [PwdLastSet], getdate()) AS 'days PwdLastSet'
FROM [tempdb].[dbo].[tmp_ADComputers] 
WHERE cn NOT IN (SELECT name0 FROM v_GS_Computer_System) 
ORDER BY LastLogon