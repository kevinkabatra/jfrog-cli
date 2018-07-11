#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile `
    -PackageName 'JFrog CLI' `
    -FileFullPath "$env:ProgramData\JFrog\jfrog.exe" `
    -Url 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path=1.17.0%2Fjfrog-cli-windows-amd64%2Fjfrog.exe' `
    -Checksum '737444999E7F503101C20A65B696FA9431ECB3A66D119921F722056CA65F3591296BA3E726029B2FC4226FEB6443716CD94ED6947B9DA6ECD62A6DFE14BE6B16' `
    -ChecksumType 'sha512' `
    -ForceDownload
    
Install-ChocolateyPath -PathToInstall "$env:ProgramData\JFrog\" -PathType 'Machine'
Update-SessionEnvironment

Write-Warning ('jfrog added to PATH. It might be required to restart your session in order to use new the environment variable.')
