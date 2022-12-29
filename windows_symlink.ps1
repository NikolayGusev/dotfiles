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
