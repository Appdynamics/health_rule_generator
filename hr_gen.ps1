
[cmdletbinding()]
Param (
    [Parameter(Mandatory = $true)]
    [string]$tier,

    [Parameter(Mandatory = $true)]
    [string]$app
)

New-Item -Path "." -Name "$app" -ItemType "directory" -Force
Copy-Item ./templates/*_template.json $app -Recurse

$configFiles = Get-ChildItem ./$app/*_template.json  -Recurse
foreach ($file in $configFiles)
{
    $outfile = $tier+"_"+$file.Name
    (Get-Content $file.PSPath) |
    Foreach-Object { $_ -replace "replace_tier_name", "$tier" } |
    Set-Content ./$app/$outfile  -Force
    Remove-Item $file
}
