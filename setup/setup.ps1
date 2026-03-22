Write-Host "NVIM_CONFIG_INFO: Running Windows setup..."

if (-not (Get-Command winget -ErrorAction SilentlyContinue)){
    Write-Host "NVIM_SETUP_ERROR: winget not found."
    Write-Host "NVIM_SETUP_ERROR: Please install it from Microsoft Store (recommended)."
}

if (-not (Get-Command nvim -ErrorAction SilentlyContinue)) {
    Write-Host "NVIM_SETUP_INFO: Installing Neovim..."
    winget install --id Neovim.Neovim -e --source winget
} else {
    Write-Host "NVIM_SETUP_INFO: Neovim already installed."
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "NVIM_SETUP_INFO: Installing Git..."
    winget install --id Git.Git -e --source winget
} else {
    Write-Host "NVIM_SETUP_INFO: Git already installed."
}

Write-Host "NVIM_SETUP_INFO: Windows Setup complete."
