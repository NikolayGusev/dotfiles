
echo "#! /bin/bash" > extensions_install.sh
echo >> extensions_install.sh
code --list-extensions | xargs -I{} echo code --install-extension {} >> extensions_install.sh
echo >> extensions_install.sh
"code --uninstall-extension vscodevim.vim" >> extensions_install.sh


code --list-extensions | xargs -I{} echo code --install-extension {} > extensions_install.ps1
echo >> extensions_install.ps1
"code --uninstall-extension vscodevim.vim" >> extensions_install.ps1

