Set-ExecutionPolicy unrestricted 

.\ALC\alc.exe /project:. /out:.\Olister.app /packagecachepath:.\AlPackages

ls

$secpasswd = ConvertTo-SecureString "ZA33zIF/LKD5T0VFWb0a6yo5AXHSXSUdnqQd7kF09Zc=" -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ("OLISTERR", $secpasswd)
$appFile =  (Get-Item (".\Olister.app")).FullName

Write-Host $secpasswd
Write-Host $mycreds
Write-Host $appFile

Invoke-WebRequest `
            -Method Patch `
            -Uri "https://api.businesscentral.dynamics.com/v2.0/cft19366.onmicrosoft.com/Sandbox/api/microsoft/automation/v1.0/companies(952e3bf1-8067-4dcd-ab58-f5a1fad7b2d3)/extensionUpload(0)/content" `
            -Credential $mycreds `
           -ContentType "application/octet-stream" `
           -Headers @{"If-Match" = "*"} `
           -InFile $appFile | Out-Null


Start-Sleep -s 10