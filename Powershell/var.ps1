$currentWorkingDirectory = (Get-Location).Path | Split-Path -Parent
$aksRootDirectory = Join-Path $currentWorkingDirectory "k8s/AKS"
$techTalksDB2019RootDirectory = Join-Path $aksRootDirectory "TechTalksDB2019"
$techTalksAPIRootDirectory = Join-Path $aksRootDirectory "TechTalksAPI"
$techTalksWebRootDirectory = Join-Path $aksRootDirectory "TechTalksWeb"