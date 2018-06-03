#JFrog CLI is completely contained within an .exe that is provided by the team at JFrog.
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Get-ChocolateyWebFile `
    -PackageName 'JFrog CLI' `
    -FileFullPath "$env:ProgramData\JFrog\jfrog.exe" `
    -Url 'https://bintray.com/jfrog/jfrog-cli-go/download_file?file_path=1.14.0%2Fjfrog-cli-windows-amd64%2Fjfrog.exe' `
    -Checksum '63CA8045911A1E2E36F8F6DBA78640D87F4DC84DED99AE647B8E8A21FA2C151312D43B678CE4C217758D6C0CA442BC0F867465F268CC839CF1E206936055C544' `
    -ChecksumType 'sha512' `
    -ForceDownload
    
Install-ChocolateyPath -PathToInstall "$env:ProgramData\JFrog\" -PathType 'Machine'
Update-SessionEnvironment

Write-Warning ('jfrog added to PATH. It might be required to restart your session in order to use new the environment variable.')
