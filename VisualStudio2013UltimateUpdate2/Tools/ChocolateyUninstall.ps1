$app = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq "Microsoft Visual Studio Ultimate 2013" }
if($app -ne $null){
    $version=$app.Version
    $uninstaller=Get-Childitem "$env:ProgramData\Package Cache\" -Recurse -Filter vs_ultimate.exe
    Uninstall-ChocolateyPackage 'VisualStudio2013UltimateUpdate2' 'exe' "/Uninstall /force /Passive /NoRestart" $uninstaller.FullName
}