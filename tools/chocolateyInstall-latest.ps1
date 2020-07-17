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

  checksum      = 'C3CA21F8E4FFCC1BC95776716F9C352FEE85184622430544E06EB675F35083CB'
  checksumType  = 'sha256'
  checksum64    = '4D69D5F17B401BD4012063227E72B48DF468EBFAFAD2DE33B46F7F76465CAB51'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs
