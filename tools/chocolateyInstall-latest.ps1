$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "5.3.0"
$url        = "https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Latest/OmegaT%20${version}/OmegaT_${version}_Beta_Windows_Signed.exe"
$url64      = "https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Latest/OmegaT%20${version}/OmegaT_${version}_Beta_Windows_64_Signed.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  installerType = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'OmegaT*'

  silentArgs    = '/VERYSILENT'
  validExitCodes = @(0)

  checksum      = 'D5682962C6BA696ECE28A6A9CD2C2083532EB2691F871C5BE075B25C26290419'
  checksumType  = 'sha256'
  checksum64    = '94DE84089F3AFCCBE4E0029468A0C58756FDCC985C989337F31F3FABFC3460B7'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs
