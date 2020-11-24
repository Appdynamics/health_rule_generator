# Sequentially runs every file to generate all Health Rules and Dashboards.
# How To Run:
#   powershell .\makeall_gen.ps1 -App APPLICATION -User USERNAME -Pass PASSWORD -Account ACCOUNT -Url https://CONTROLLER.saas.appdynamics.com:443 

[cmdletbinding()]
Param (
    [Parameter(Mandatory = $true)]
    [string]$user,

    [Parameter(Mandatory = $true)]
    [string]$pass,

    [Parameter(Mandatory = $true)]
    [string]$account,

    [Parameter(Mandatory = $true)]
    [string]$url,

    [Parameter(Mandatory = $true)]
    [string]$app
)
Write-Host "Generating Tier Level Health Rules"
.\hr_gen.ps1 -app $app -user $user -pass $pass -url $url -account $account
Write-Host "Generating Database Level Health Rules"
.\db_gen.ps1 -app $app
Write-Host "Generating Infrastructure Level Health Rules"
.\infra_gen.ps1 -app $app
Write-Host "Generating Network Level Health Rules"
.\network_gen.ps1 -app $app
Write-Host "Generating Dashboard"
.\dash_gen.ps1 -app $app


