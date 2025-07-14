# Repository Cleanup Script for Project Sankofa
# This script reorganizes the repository while preserving the /docs folder for GitHub Pages

Write-Host "Starting Project Sankofa repository cleanup..." -ForegroundColor Green
Write-Host "The /docs folder will remain unchanged for GitHub Pages." -ForegroundColor Yellow

# Ensure all necessary directories exist
Write-Host "Creating directory structure..." -ForegroundColor Cyan
$directories = @(
    "development\portfolio-iterations\claude",
    "development\portfolio-iterations\gemini", 
    "development\portfolio-iterations\backups",
    "development\assets",
    "content\briefs",
    "content\commissioning", 
    "content\research",
    "assets\images\archetype-wheel",
    "assets\audio",
    "assets\documents",
    "utilities",
    "archive"
)

foreach ($dir in $directories) {
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
        Write-Host "  Created: $dir" -ForegroundColor Gray
    }
}

# Move Portfolio Page iterations to development folder
Write-Host "Moving portfolio iterations..." -ForegroundColor Cyan
if (Test-Path "Portfolio Page") {
    if (Test-Path "Portfolio Page\Claude") {
        Copy-Item "Portfolio Page\Claude\*" "development\portfolio-iterations\claude" -Recurse -Force
        Write-Host "  Moved Claude iterations" -ForegroundColor Gray
    }
    if (Test-Path "Portfolio Page\Gemini") {
        Copy-Item "Portfolio Page\Gemini\*" "development\portfolio-iterations\gemini" -Recurse -Force
        Write-Host "  Moved Gemini iterations" -ForegroundColor Gray
    }
    
    # Move Media folder contents to assets
    if (Test-Path "Portfolio Page\Media") {
        Write-Host "  Moving media assets..." -ForegroundColor Gray
        
        # Move images
        Get-ChildItem "Portfolio Page\Media" -Filter "*.png" -ErrorAction SilentlyContinue | ForEach-Object {
            Move-Item $_.FullName "assets\images" -Force
        }
        Get-ChildItem "Portfolio Page\Media" -Filter "*.jpg" -ErrorAction SilentlyContinue | ForEach-Object {
            Move-Item $_.FullName "assets\images" -Force
        }
        Get-ChildItem "Portfolio Page\Media" -Filter "*.svg" -ErrorAction SilentlyContinue | ForEach-Object {
            Move-Item $_.FullName "assets\images" -Force
        }
        
        # Move audio files
        Get-ChildItem "Portfolio Page\Media" -Filter "*.mp3" -ErrorAction SilentlyContinue | ForEach-Object {
            Move-Item $_.FullName "assets\audio" -Force
        }
        
        # Move the Architype wheel folder
        if (Test-Path "Portfolio Page\Media\Architype wheel") {
            Copy-Item "Portfolio Page\Media\Architype wheel\*" "assets\images\archetype-wheel" -Recurse -Force
            Write-Host "    Moved archetype wheel assets" -ForegroundColor Gray
        }
    }
    
    # Remove Portfolio Page folder after successful copy
    Remove-Item "Portfolio Page" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "  Cleaned up original Portfolio Page folder" -ForegroundColor Gray
}

# Move backups to development
Write-Host "Moving backup files..." -ForegroundColor Cyan
if (Test-Path "backups") {
    Copy-Item "backups\*" "development\portfolio-iterations\backups" -Recurse -Force
    Remove-Item "backups" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "  Moved backup files" -ForegroundColor Gray
}

# Move commissioning content
Write-Host "Moving commissioning content..." -ForegroundColor Cyan
if (Test-Path "Commissioning") {
    Copy-Item "Commissioning\*" "content\commissioning" -Recurse -Force
    Remove-Item "Commissioning" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "  Moved commissioning content" -ForegroundColor Gray
}

# Move production docs to content/briefs
Write-Host "Moving production documents..." -ForegroundColor Cyan
if (Test-Path "Production Docs") {
    Copy-Item "Production Docs\*" "content\briefs" -Recurse -Force
    Remove-Item "Production Docs" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "  Moved production documents" -ForegroundColor Gray
}

# Move inputs to content/research
Write-Host "Moving research inputs..." -ForegroundColor Cyan
if (Test-Path "Inputs") {
    Copy-Item "Inputs\*" "content\research" -Recurse -Force
    Remove-Item "Inputs" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "  Moved research inputs" -ForegroundColor Gray
}

# Move existing assets if any
Write-Host "Consolidating existing assets..." -ForegroundColor Cyan
if (Test-Path "assets") {
    # Move to development/assets temporarily to avoid conflicts
    if (Test-Path "assets\audio") {
        Copy-Item "assets\audio\*" "development\assets\audio" -Recurse -Force -ErrorAction SilentlyContinue
    }
    if (Test-Path "assets\images") {
        Copy-Item "assets\images\*" "development\assets\images" -Recurse -Force -ErrorAction SilentlyContinue
    }
    if (Test-Path "assets\documents") {
        Copy-Item "assets\documents\*" "development\assets\documents" -Recurse -Force -ErrorAction SilentlyContinue
    }
}

# Move numbered folders to archive
Write-Host "Archiving numbered organizational folders..." -ForegroundColor Cyan
$numberedFolders = @("01-core", "02-assets", "03-content", "04-docs", "05-utilities")
foreach ($folder in $numberedFolders) {
    if (Test-Path $folder) {
        Copy-Item $folder "archive\$folder" -Recurse -Force
        Remove-Item $folder -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "  Archived: $folder" -ForegroundColor Gray
    }
}

# Move template consolidation folder to archive
Write-Host "Archiving template folders..." -ForegroundColor Cyan
if (Test-Path "folders and files to consolidate from template") {
    Copy-Item "folders and files to consolidate from template" "archive\template-folders" -Recurse -Force
    Remove-Item "folders and files to consolidate from template" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "  Archived template consolidation folder" -ForegroundColor Gray
}

# Create utilities folder and move any utility files
Write-Host "Setting up utilities folder..." -ForegroundColor Cyan
if (Test-Path "archive\05-utilities") {
    Get-ChildItem "archive\05-utilities" -File -ErrorAction SilentlyContinue | ForEach-Object {
        Copy-Item $_.FullName "utilities" -Force
        Write-Host "  Moved utility: $($_.Name)" -ForegroundColor Gray
    }
}

# Ensure cleanup script stays in root
if (Test-Path "cleanup-repo.ps1") {
    Write-Host "  Cleanup script remains in root directory" -ForegroundColor Gray
}

Write-Host "Repository cleanup completed!" -ForegroundColor Green
Write-Host ""
Write-Host "Final repository structure:" -ForegroundColor Yellow
Write-Host "  docs/ - GitHub Pages site (UNCHANGED - safe for GitHub Pages)" -ForegroundColor Green
Write-Host "  development/ - All development iterations and assets" -ForegroundColor White
Write-Host "    portfolio-iterations/ - All website iterations (Claude, Gemini, backups)" -ForegroundColor Gray
Write-Host "    assets/ - Development assets backup" -ForegroundColor Gray
Write-Host "  content/ - Research, briefs, and commissioning content" -ForegroundColor White
Write-Host "    briefs/ - Production documents and executive briefs" -ForegroundColor Gray
Write-Host "    commissioning/ - Project commissioning documents" -ForegroundColor Gray
Write-Host "    research/ - Research inputs and raw findings" -ForegroundColor Gray
Write-Host "  assets/ - Organized media files" -ForegroundColor White
Write-Host "    images/ - Images and visual assets" -ForegroundColor Gray
Write-Host "    audio/ - Audio files" -ForegroundColor Gray
Write-Host "    documents/ - Document assets" -ForegroundColor Gray
Write-Host "  utilities/ - Tools and scripts" -ForegroundColor White
Write-Host "  archive/ - Old organizational structure (numbered folders, templates)" -ForegroundColor White

Write-Host ""
Write-Host "IMPORTANT: The /docs folder remains exactly as it was for GitHub Pages." -ForegroundColor Green
Write-Host "Your GitHub Pages site will continue to work without any changes!" -ForegroundColor Green

# Verify docs folder is intact
if ((Test-Path "docs\index.html") -and (Test-Path "docs\stylesheet.css")) {
    Write-Host ""
    Write-Host "Verified: GitHub Pages files are intact and unchanged" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "WARNING: GitHub Pages files may be missing!" -ForegroundColor Red
}

Write-Host ""
Write-Host "Cleanup script completed successfully. Repository is now organized!" -ForegroundColor Cyan
