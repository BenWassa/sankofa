# Repository Cleanup Instructions

## Overview
This repository contains a PowerShell script (`cleanup-repo.ps1`) that will reorganize your Project Sankofa repository into a clean, logical structure while **preserving your GitHub Pages site unchanged**.

## ⚠️ IMPORTANT: GitHub Pages Safety
The `/docs` folder contains your live GitHub Pages website and will **NOT be touched** by this script. Your website will continue to work exactly as it does now.

## What the Script Does

### Moves and Organizes:
- **Portfolio iterations** → `development/portfolio-iterations/`
- **Production documents** → `content/briefs/`
- **Research materials** → `content/research/`
- **Commissioning docs** → `content/commissioning/`
- **Media assets** → `assets/` (organized by type)
- **Old numbered folders** → `archive/`
- **Template materials** → `archive/`

### Creates New Structure:
```
sankofa/
├── docs/                    # GitHub Pages (UNTOUCHED)
├── development/             # All development work
├── content/                 # Research & documentation
├── assets/                  # Organized media files
├── utilities/               # Scripts and tools
├── archive/                 # Historical organization
├── README.md
└── cleanup-repo.ps1
```

## How to Run the Cleanup

### Option 1: Run from VS Code Terminal
1. Open VS Code terminal (Ctrl+`)
2. Make sure you're in the root directory: `cd c:\Users\benjamin.haddon\Documents\sankofa`
3. Run: `.\cleanup-repo.ps1`

### Option 2: Run from PowerShell
1. Open PowerShell as Administrator
2. Navigate to the directory: `cd "c:\Users\benjamin.haddon\Documents\sankofa"`
3. Run: `.\cleanup-repo.ps1`

### Option 3: Double-click the file
- Right-click `cleanup-repo.ps1` → "Run with PowerShell"

## What to Expect

The script will:
1. ✅ Show what it's doing with colored output
2. ✅ Create all necessary directories
3. ✅ Copy (not move) files to avoid data loss
4. ✅ Remove original folders only after successful copy
5. ✅ Verify GitHub Pages files are intact
6. ✅ Show a summary of the new structure

## After Running

Your repository will be cleanly organized with:
- **GitHub Pages site unchanged** and working
- **All content preserved** in logical locations
- **Development history maintained** in organized folders
- **Easy navigation** to find any project component

## Troubleshooting

If you encounter any issues:
1. The script has safety checks and won't overwrite files
2. Your `/docs` folder is never touched
3. All moves are copy-then-delete to prevent data loss
4. Run `git status` to see what changed before committing

## Next Steps

After cleanup:
1. Review the new structure
2. Update any internal links or references as needed
3. Consider updating your `.gitignore` if needed
4. Commit the new organization to Git

Your GitHub Pages site will continue working without any changes needed!
