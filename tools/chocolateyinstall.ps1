#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile `
    -PackageName 'JFrog CLI' `
    -FileFullPath "$env:ProgramData\JFrog\jfrog.exe" `
    -Url 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path=1.11.2%2Fjfrog-cli-windows-amd64%2Fjfrog.exe' `
    -Checksum 'F10555E5145F77A0DB99792CB478B9931E3E053BC648874B8A3E75FEE705709E996417AFAB3494E637041A03C8D1ECA50B73E27C7324562B2AB0F3DB234C0699' `
    -ChecksumType 'sha512' `
    -ForceDownload
    
Install-ChocolateyPath -PathToInstall "$env:ProgramData\JFrog\" -PathType 'Machine'
Update-SessionEnvironment

Write-Warning ('jfrog added to PATH. It might be required to restart your session in order to use new the environment variable.')