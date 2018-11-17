#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile `
    -PackageName 'JFrog CLI' `
    -FileFullPath "$env:ProgramData\JFrog\jfrog.exe" `
    -Url 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path=1.20.1%2Fjfrog-cli-windows-amd64%2Fjfrog.exe' `
    -Checksum 'C800B7FDEE8957D1490303C269C07FD450A8BD94A39E1454DE7D69020115A8F9C50B890097BD99AADFD56070A68EF18B85713EF82F4A0884AEEEC5841F3E487B' `
    -ChecksumType 'sha512' `
    -ForceDownload
    
Install-ChocolateyPath -PathToInstall "$env:ProgramData\JFrog\" -PathType 'Machine'
Update-SessionEnvironment

Write-Warning ('jfrog added to PATH. It might be required to restart your session in order to use new the environment variable.')
