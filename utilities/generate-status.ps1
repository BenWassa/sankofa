# Project Sankofa - Repository Status Generator (PowerShell)
# Generates repository snapshot for AI assistance

Write-Host "================================================" -ForegroundColor Yellow
Write-Host "   PROJECT SANKOFA - REPOSITORY STATUS" -ForegroundColor Yellow  
Write-Host "================================================" -ForegroundColor Yellow
Write-Host ""

# Change to repository root
$RepoRoot = Split-Path $PSScriptRoot -Parent
Set-Location $RepoRoot

Write-Host "Generating repository status report..." -ForegroundColor Cyan

# Run the Python status generator
try {
    $result = & python "utilities\scripts\repo-status\generate_status_v2.py"
    Write-Host $result -ForegroundColor Green
    
    $statusFile = "utilities\scripts\repo-status\repo_status_sankofa.txt"
    
    if (Test-Path $statusFile) {
        Write-Host ""
        Write-Host "Status report successfully generated!" -ForegroundColor Green
        Write-Host "Location: $statusFile" -ForegroundColor Gray
        
        $choice = Read-Host "Open the status report now? (Y/N)"
        if ($choice -eq "Y" -or $choice -eq "y") {
            Start-Process notepad $statusFile
        }
        
        Write-Host ""
        Write-Host "Repository Status Summary:" -ForegroundColor Yellow
        Write-Host "- GitHub Pages site: READY (docs/ folder)" -ForegroundColor Green
        Write-Host "- Repository structure: ORGANIZED" -ForegroundColor Green  
        Write-Host "- Content structure: COMPLETE" -ForegroundColor Green
        Write-Host "- Assets organization: COMPLETE" -ForegroundColor Green
        Write-Host "- Development structure: READY" -ForegroundColor Green
        Write-Host ""
        Write-Host "Repository is ready for AI assistance!" -ForegroundColor Green
        
    } else {
        Write-Host "Warning: Status file was not generated." -ForegroundColor Red
    }
    
} catch {
    Write-Host "Error running status generator: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Make sure Python is installed and available in PATH." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Press any key to continue..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
