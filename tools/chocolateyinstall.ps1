#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile `
    -PackageName 'JFrog CLI' `
    -FileFullPath "$env:ProgramData\JFrog\jfrog.exe" `
    -Url 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path=1.16.2%2Fjfrog-cli-windows-amd64%2Fjfrog.exe' `
    -Checksum '4CDD356AFD2390EFABEA510CF0CE5A93A0AF2135D8FCCD88530AEEFCFE595FCB7E5DECDCCE813CE61F1A07A26C92D15122E8692BAFFA5EEA8864AC4D3034F3D8' `
    -ChecksumType 'sha512' `
    -ForceDownload
    
Install-ChocolateyPath -PathToInstall "$env:ProgramData\JFrog\" -PathType 'Machine'
Update-SessionEnvironment

Write-Warning ('jfrog added to PATH. It might be required to restart your session in order to use new the environment variable.')
