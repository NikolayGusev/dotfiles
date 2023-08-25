 Write-Error 'Sync with .sh version first'

code --list-extensions | % { "code --install-extension $_" } > extensions_install.ps1

"#! /bin/bash" > extensions_install.sh
code --list-extensions | % { "code --install-extension $_" } >> extensions_install.sh
