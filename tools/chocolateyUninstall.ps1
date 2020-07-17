$packageName = 'omegat'

if ( test-path "C:\Program Files (x86)" ) {
	$unpath = "C:\Program Files (x86)\OmegaT\unins000.exe"
} else {
	$unpath = "C:\Program Files\OmegaT\unins000.exe"
}

Uninstall-ChocolateyPackage $packageName 'exe' '/VERYSILENT' "$unpath" -validExitCodes @(0)
