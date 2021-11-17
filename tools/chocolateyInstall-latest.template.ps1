$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "@VERSION@"
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

  checksum      = '@CHECKSUM32@'
  checksumType  = 'sha256'
  checksum64    = '@CHECKSUM64@'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs
