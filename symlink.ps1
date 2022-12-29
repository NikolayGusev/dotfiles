function LinkDotFiles {
    param ($LocalDir, $TargetDir)
    New-Item -Path $TargetDir -ItemType SymbolicLink -Value $LocalDir -Force
}

function LinkDotFilesOneByOne {
    param ($LocalDir, $TargetDir)
    Get-ChildItem -Path $LocalDir | ForEach-Object {
        LinkDotFiles -TargetDir (Join-Path $TargetDir $_.Name) -LocalDir (Join-Path $LocalDir $_.Name)
    }
}



LinkDotFiles -TargetDir "$($env:LOCALAPPDATA)\nvim" -LocalDir .\nvim
LinkDotFilesOneByOne -TargetDir "$($env:APPDATA)\Code\User" -LocalDir .\vscode






#$configPath = (Join-Path $PSScriptRoot '.config')

# Set up symlinks
#if ($IsWindows) {
#    Get-ChildItem -Path (Join-Path $configPath 'powershell') | ForEach-Object {
#        New-Item -Path (Join-Path '~/Documents/PowerShell' $_.Name) -ItemType SymbolicLink -Value $_.FullName -Force
#    }
#} else {
#    Get-ChildItem -Path $configPath | ForEach-Object {
#        New-Item -Path (Join-Path '~/.config' $_.Name) -ItemType SymbolicLink -Value $_.FullName -Force
#    }
#}

#Install-Module PSDepend -Force
#Invoke-PSDepend -Force (Join-Path $PSScriptRoot 'requirements.psd1')
