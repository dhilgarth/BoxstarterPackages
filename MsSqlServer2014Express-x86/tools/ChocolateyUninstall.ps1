$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$exePath = "$scriptPath\SQLEXPR_x86_ENU.exe"
$extractPath = "$scriptPath\SQLEXPR_x86_ENU"
$setupPath = "$extractPath\setup.exe"

Write-Host "Extracting..."
Start-Process "$exePath" "/Q /x:`"$extractPath`"" -Wait

Write-Host "Uninstalling..."
& "$setupPath" /IACCEPTSQLSERVERLICENSETERMS /FEATURES=SQL /Q /ACTION=uninstall

Write-Host "Removing extracted files..."
rm -r "$extractPath"