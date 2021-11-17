
# .\make_latest.ps1 5.7.0

$version=$args[0]

Write-Output "Creating Omegat $version latest Chocolatey package"
Write-Output "---------------------------------------------"

Write-Output "Make sure you saved the latest changelog from https://github.com/omegat-org/omegat/blob/master/release/changes.txt in changelog.txt"
Read-Host -Prompt "Press any key to continue..."

$changelog=Get-Content -Raw -Path "changelog.txt"
Write-Output "Changelog: $changelog"

Write-Output "Fetching $version 64bits..."
##Invoke-WebRequest -OutFile "OmegaT_${version}_Beta_Windows_64_Signed.exe" "https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Latest/OmegaT%20${version}/OmegaT_${version}_Beta_Windows_64_Signed.exe"
wsl wget "https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Latest/OmegaT%20${version}/OmegaT_${version}_Beta_Windows_64_Signed.exe"

Write-Output "Fetching $version 32bits..."
##Invoke-WebRequest -OutFile "OmegaT_${version}_Beta_Windows_Signed.exe" "https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Latest/OmegaT%20${version}/OmegaT_${version}_Beta_Windows_Signed.exe"
wsl wget "https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Latest/OmegaT%20${version}/OmegaT_${version}_Beta_Windows_Signed.exe"

Write-Output "Generating checksums..."
$checksum64=checksum -t sha256 OmegaT_${version}_Beta_Windows_64_Signed.exe
$checksum32=checksum -t sha256 OmegaT_${version}_Beta_Windows_Signed.exe

Write-Output "  Checksum 32: [$checksum32]"
Write-Output "  Checksum 64: [$checksum64]"

Write-Output "Updating nuspec file..."

(Get-Content -path "omegat-latest.nuspec") `
    -replace "@VERSION@", "$version" `
    -replace "@CHANGELOG@", "$changelog" `
    | Set-Content -Path "omegat-latest-${version}.nuspec"

Write-Output "Updating chocolateyInstall script..."
(Get-Content -path "tools\chocolateyInstall-latest.template.ps1") `
    -replace "@VERSION@", "$version" `
    -replace "@CHECKSUM32@", "$checksum32" `
    -replace "@CHECKSUM64@", "$checksum64" `
    | Set-Content -Path "tools\chocolateyInstall-latest.ps1"

Write-Output "Choco pack..."
choco pack omegat-latest-${version}.nuspec

Write-Output "Choco install..."
choco install --pre --source=. --version=${version}-beta omegat

Write-Output "Choco push..."
choco push omegat.${version}-beta.nupkg -s https://push.chocolatey.org/

Write-Output "Done!"
