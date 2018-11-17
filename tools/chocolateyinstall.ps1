#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile `
    -PackageName 'JFrog CLI' `
    -FileFullPath "$env:ProgramData\JFrog\jfrog.exe" `
    -Url 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path=1.20.2%2Fjfrog-cli-windows-amd64%2Fjfrog.exe' `
    -Checksum 'FFECC313C95B0CA91A287BC080DCF61052C72C0F8BFE3F869BBC2AF3183D7753932E3BC25789BE7405BCDD910797A52E8E81ECAB644D5A1C56ED3B3D1C1EC99D' `
    -ChecksumType 'sha512' `
    -ForceDownload
    
Install-ChocolateyPath -PathToInstall "$env:ProgramData\JFrog\" -PathType 'Machine'
Update-SessionEnvironment

Write-Warning ('jfrog added to PATH. It might be required to restart your session in order to use new the environment variable.')
