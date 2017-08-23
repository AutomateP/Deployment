# Script created by Maurice Daly - Provided as is, as always verify code before using #
$Username = 'yourdomain\useraccount'
$encrypted = Get-Content -Path '\\fileserver\yourshare\Required.txt'
$key = (1..16)
$Password = $encrypted | ConvertTo-SecureString -Key $key
$Credentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username, $Password
$DC = "YourDomainControllerName"
$ADPowerShell = New-PSSession -ComputerName $DC -Credential $Credentials
$CurrentName = $env:COMPUTERNAME
netsh advfirewall set allprofiles state off
Invoke-Command -Session $ADPowerShell -scriptblock {
	import-module ActiveDirectory
	$clientname = $($args[0])
	$Username = 'yourdomain\useraccount'
	$encrypted = Get-Content -Path '\\fileserver\yourshare\Required.txt'
    $key = (1..16)
    $password = $encrypted | ConvertTo-SecureString -Key $key
    $DomainCredentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username, $Password
    $TypeLocation = $ClientName.Substring(0, $ClientName.Length - 4)
    $UsedNumbers = Get-ADComputer -Filter * -Properties Name | Where-Object { $_.Name -like ("$TypeLocation" + "*") } | ForEach-Object { Write-Output $($_.Name.Substring($_.Name.length - 4, 4)) }
    $values = 1000..1999
    $adcheck = 0
    Do
    {
        # Set beginning of sequence number
        $NextNumber = 1000
        # Increment active directory check flag
        $adcheck++
        Do
        {
            $values[$NextNumber]
            $NextNumber++
        }
        Until ($UsedNumbers.Contains("$NextNumber") -eq $false)
        $ComputerName = ("$TypeLocation" + "$NextNumber")
        start-sleep -Seconds 2
    }
    while ($adcheck -le 3)
    Rename-Computer -ComputerName $ClientName -NewName $ComputerName -DomainCredential $DomainCredentials
    Exit-PSSession
} -ArgumentList $CurrentName
Remove-PSSession $ADPowerShell
# Re-enable the local firewall
netsh advfirewall set allprofiles state on
