# Generates The DB Level Health Rules For The Specified Application
# How To Run:
#   powershell .\db_gen.ps1 -App APPLICATION

[cmdletbinding()]
Param (
    [Parameter(Mandatory = $true)]
    [string]$app
)

New-Item -Path "." -Name "$app" -ItemType "directory" -Force
Copy-Item ./templates/database/*_template.json $app -Recurse

$configFiles = Get-ChildItem ./$app/*_template.json  -Recurse

foreach ($file in $configFiles)
{
    $outfile = "database_"+$file.Name.Replace("template","final")
    (Get-Content $file.PSPath) |
    Set-Content ./$app/$outfile  -Force
    Remove-Item $file
}
