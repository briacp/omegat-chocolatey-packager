
* Grab the install files to calculate the checksums
  * Standard
```
wsl wget 'https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Standard/OmegaT%204.3.2/OmegaT_4.3.2_Windows_64_Signed.exe'
wsl wget 'https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Standard/OmegaT%204.3.2/OmegaT_4.3.2_Window_Signed.exe'
checksum -t sha256 OmegaT_4.3.2_Beta_Window_Signed.exe
checksum -t sha256 OmegaT_4.3.2_Beta_Window_64_Signed.exe
```

  * Latest
```
wsl wget 'https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Latest/OmegaT%205.2.0/OmegaT_5.2.0_Beta_Windows_64_Signed.exe'
wsl wget 'https://downloads.sourceforge.net/project/omegat/OmegaT%20-%20Latest/OmegaT%205.2.0/OmegaT_5.2.0_Beta_Window_Signed.exe'
checksum -t sha256 OmegaT_5.2.0_Beta_Window_Signed.exe
checksum -t sha256 OmegaT_5.2.0_Beta_Window_64_Signed.exe
```

* Edit `<version>` (adding the `-beta` suffix for the latest version) and `<releaseNotes>` in `omegat.nuspec`.
* Edit `tools/chocolateyinstall.ps1` and change `$version`, `checksum` and `checksum64`.

* `choco pack`
* `choco install -s . omegat`
* `choco push omegat.4.3.2.nupkg -s https://push.chocolatey.org/`
