
echo "#! /bin/bash" > test.sh
echo >> test.sh
code --list-extensions | xargs -I{} echo code -intall-extension {} >> extensions_install.sh


code --list-extensions | xargs -I{} echo code -intall-extension {} > extensions_install.ps1