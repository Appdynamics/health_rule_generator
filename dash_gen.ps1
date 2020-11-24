# Modified to create a child directory of Tier under each App to prevent having the files breaking if running multiple iterations 
# Generates The Dashboard(s) For The Specified Application
# How To Run:
#   powershell .\dash_gen.ps1 -App APPLICATION

[cmdletbinding()]
Param (
    [Parameter(Mandatory = $true)]
    [string]$app
)

$dashfolder = "_DASHBOARDS"

New-Item -Path "." -Name "$app/$dashfolder" -ItemType "directory" -Force
Copy-Item ./templates/dashboard/*_template.json $app/$dashfolder -Recurse

$configFiles = Get-ChildItem ./$app/$dashfolder/*_template.json  -Recurse

foreach ($file in $configFiles)
{
    $outfile = $app+"_"+$file.Name
    (Get-Content $file.PSPath) |
    Set-Content ./$app/$dashfolder/$outfile  -Force
    Remove-Item $file
}


