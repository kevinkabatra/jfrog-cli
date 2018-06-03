#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile `
    -PackageName 'JFrog CLI' `
    -FileFullPath "$env:ProgramData\JFrog\jfrog.exe" `
    -Url 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path=1.16.1%2Fjfrog-cli-windows-amd64%2Fjfrog.exe' `
    -Checksum '64F631787D2740EA2E94EBC3875BECAF540BAF00B189197DEC8377A0E92F0747C54BD549DA9AAB71D2AEBDFE50ED5471C0B2C268E1396FA951BAFFD563DBC891' `
    -ChecksumType 'sha512' `
    -ForceDownload
    
Install-ChocolateyPath -PathToInstall "$env:ProgramData\JFrog\" -PathType 'Machine'
Update-SessionEnvironment

Write-Warning ('jfrog added to PATH. It might be required to restart your session in order to use new the environment variable.')
