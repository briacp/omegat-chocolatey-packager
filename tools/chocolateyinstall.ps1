$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = "5.2.0"

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

  checksum      = 'D5A3B5031FA9FD6FC61B0A44DCA3070DCE5E946D2CF773C3F52A193309872103'
  checksumType  = 'sha256'
  checksum64    = '3B739753D3E0BF1AE0B84CFF9238359028812458B846762F03B91794F6DD2CB3'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs
