#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile `
    -PackageName 'JFrog CLI' `
    -FileFullPath "$env:ProgramData\JFrog\jfrog.exe" `
    -Url 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path=1.21.0%2Fjfrog-cli-windows-amd64%2Fjfrog.exe' `
    -Checksum '2F07B00B29A99F68B0926D89E81096341CA622AFB84CA8E73A8B431A8CA0B77AF6272D653A1EEF34EC6BA6F847CBB97AA509B0592748CB5BC108A13A151D53C3' `
    -ChecksumType 'sha512' `
    -ForceDownload
    
Install-ChocolateyPath -PathToInstall "$env:ProgramData\JFrog\" -PathType 'Machine'
Update-SessionEnvironment

Write-Warning ('jfrog added to PATH. It might be required to restart your session in order to use new the environment variable.')
