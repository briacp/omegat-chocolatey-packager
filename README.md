# OmegaT Chocolatey Packager

## Packaging Standard and Latest versions

* Grab the install files to calculate the checksums
  * Standard
```
wsl wget 'https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Standard/OmegaT%204.3.2/OmegaT_4.3.2_Windows_64_Signed.exe'
wsl wget 'https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Standard/OmegaT%204.3.2/OmegaT_4.3.2_Windows_Signed.exe'
checksum -t sha256 OmegaT_4.3.2_Beta_Windows_Signed.exe
checksum -t sha256 OmegaT_4.3.2_Beta_Windows_64_Signed.exe
```

  * Latest
```
wsl wget 'https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Latest/OmegaT%205.2.0/OmegaT_5.2.0_Beta_Windows_64_Signed.exe'
wsl wget 'https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Latest/OmegaT%205.2.0/OmegaT_5.2.0_Beta_Windows_Signed.exe'
checksum -t sha256 OmegaT_5.2.0_Beta_Windows_Signed.exe
checksum -t sha256 OmegaT_5.2.0_Beta_Windows_64_Signed.exe
```

* Edit `<version>` (adding the `-beta` suffix for the latest version) and `<releaseNotes>` in `omegat-[latest|standard].nuspec`.
* Add the changelog from `https://github.com/omegat-org/omegat/blob/master/release/changes.txt` in `omegat-[latest|standard].nuspec`.

* Edit `tools/chocolateyInstall-[latest|standard].ps1` and change `$version`, `checksum` and `checksum64`.

* `choco pack omegat-[latest|standard].nuspec`

* `choco install --pre --source=. --version=[version] omegat` (to check the installation is working fine)

* `choco push omegat.[version].nupkg -s https://push.chocolatey.org/`
