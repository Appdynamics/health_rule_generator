# Generates The Tier Level Health Rules For The Specified Application
# How To Run:
#   powershell .\hr_gen.ps1 -App APPLICATION -User USERNAME -Pass PASSWORD -Account ACCOUNT -Url https://CONTROLLER.saas.appdynamics.com:443 

[cmdletbinding()]
Param (
    [Parameter(Mandatory = $true)]
    [string]$user,

    [Parameter(Mandatory = $true)]
    [string]$pass,

    [Parameter(Mandatory = $true)]
    [string]$url,

    [Parameter(Mandatory = $true)]
    [string]$account,

    [Parameter(Mandatory = $true)]
    [string]$app
)

$pair = "$($user)@$($account):$($pass)"

$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($pair))

$basicAuthValue = "Basic $encodedCreds"

$Headers = @{
    Authorization = $basicAuthValue
}

$Uri = $url+'/controller/rest/applications/'+$app+'/tiers?output=JSON'

$tiers = Invoke-WebRequest -URI $Uri -Header $Headers | ConvertFrom-Json


ForEach ($tier in $tiers){
    $tierName = $tier.name

    if ($tierName -ne "Machine Agent"){
    
        New-Item -Path "." -Name "$app" -ItemType "directory" -Force
        Copy-Item ./templates/tier/*_template.json $app -Recurse

        $configFiles = Get-ChildItem ./$app/*_template.json -Recurse

        foreach ($file in $configFiles)
        {
            Write-Host "WORKING ON THIS FILE: " $file
            $outfile = "tier_"+$tierName+"_"+$file.Name.Replace("template","final")
            (Get-Content $file.PSPath) |
            Foreach-Object { $_ -replace "replace_tier_name", "$tierName" } |
            Set-Content ./$app/$outfile  -Force
            Remove-Item $file
        }
    }

}




