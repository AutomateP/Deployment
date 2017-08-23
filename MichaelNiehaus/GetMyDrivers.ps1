#Requires -version 2.0

# ***************************************************************************
# 
# File:      GetMyDrivers.ps1
#
# Version:   1.0
# 
# Author:    Michael Niehaus 
# 
# Purpose:   Grabs all of the out-of-box drivers from the driver repository
#            in Windows 8 and above.  (This uses the Get-WindowsDriver cmdlet
#            that is only present in Windows 8 and above.)
#
# ------------- DISCLAIMER -------------------------------------------------
# This script code is provided as is with no guarantee or waranty concerning
# the usability or impact on systems and may be used, distributed, and
# modified in any way provided the parties agree and acknowledge the 
# Microsoft or Microsoft Partners have neither accountabilty or 
# responsibility for results produced by use of this script.
#
# Microsoft will not provide any support through any means.
# ------------- DISCLAIMER -------------------------------------------------
#
# ***************************************************************************

Param (
    [parameter(Mandatory = $true)] [string] $destination
)
PROCESS
{
    Get-WindowsDriver -online | % {
       $dir = Split-Path $_.OriginalFileName -Parent ;
       $subdir = Split-Path $dir -Leaf ;
       $driverDest = "$destination\$subdir";
       Write-Host "Copying $dir to $driverDest\$subdir" ;
       Copy-Item -Path $dir -Destination $driverDest -Recurse
    }
}
