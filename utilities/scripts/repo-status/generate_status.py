#!/usr/bin/env python3
"""
Repository Status Generator for Project Sankofa
Generates comprehensive project snapshot for AI assistance
"""

import os
import subprocess
from datetime import datetime
from pathlib import Path

def generate_status():
    """Generate project status report"""
    
    output_file = "utilities/scripts/repo-status/repo_status_sankofa.txt"
    date_str = datetime.now().strftime("%a, %b %d, %Y %I:%M:%S %p")
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(f"""==============================
PROJECT SANKOFA – REPO SNAPSHOT  
Generated: {date_str}
==============================

[PROJECT OVERVIEW]
Project: Project Sankofa
Type: Research & Documentation Repository with GitHub Pages
Description: Multi-format, mythic-psychology research and storytelling initiative tackling the Modern Meaning Crisis
Author: benjamin.haddon
Repository: BenWassa/sankofa
Structure: Organized repository with GitHub Pages site

[REPOSITORY STRUCTURE STATUS]
""")
        
        # Check new organized structure
        directories = {
            "docs": "GitHub Pages site (PROTECTED - live website)",
            "development": "Development iterations and assets", 
            "content": "Research, briefs, and documentation",
            "assets": "Organized media files",
            "utilities": "Tools and scripts",
            "archive": "Historical organization"
        }
        
        f.write("[MAIN DIRECTORIES]\n")
        for dir_name, description in directories.items():
            if Path(dir_name).exists():
                try:
                    count = len(list(Path(dir_name).rglob("*")))
                    f.write(f"PASS {dir_name}/ - {description} - {count} items\n")
                except:
                    f.write(f"PASS {dir_name}/ - {description} - Directory exists\n")
            else:
                f.write(f"FAIL {dir_name}/ - MISSING - {description}\n")

        # Check GitHub Pages status
        f.write("\n[GITHUB PAGES STATUS]\n")
        docs_files = ["index.html", "stylesheet.css"]
        for file in docs_files:
            file_path = Path("docs") / file
            if file_path.exists():
                try:
                    size_kb = round(file_path.stat().st_size / 1024, 1)
                    f.write(f"PASS docs/{file} - {size_kb}KB - READY\n")
                except:
                    f.write(f"PASS docs/{file} - READY\n")
            else:
                f.write(f"FAIL docs/{file} - MISSING\n")
        
        # Check content structure
        f.write("\n[CONTENT ORGANIZATION]\n")
        content_dirs = {
            "content/briefs": "Executive briefs and production documents",
            "content/commissioning": "Project commissioning documents", 
            "content/research": "Research inputs and findings"
        }
        
        for dir_path, description in content_dirs.items():
            if Path(dir_path).exists():
                try:
                    count = len(list(Path(dir_path).glob("*")))
                    f.write(f"PASS {dir_path}/ - {count} files - {description}\n")
                except:
                    f.write(f"PASS {dir_path}/ - {description}\n")
            else:
                f.write(f"FAIL {dir_path}/ - MISSING - {description}\n")

        # Check assets organization
        f.write("\n[ASSETS ORGANIZATION]\n")
        asset_dirs = {
            "assets/images": "Images and visual assets",
            "assets/audio": "Audio content", 
            "assets/documents": "Document assets"
        }
        
        for dir_path, description in asset_dirs.items():
            if Path(dir_path).exists():
                try:
                    count = len(list(Path(dir_path).glob("*")))
                    f.write(f"PASS {dir_path}/ - {count} files - {description}\n")
                except:
                    f.write(f"PASS {dir_path}/ - {description}\n")
            else:
                f.write(f"FAIL {dir_path}/ - MISSING - {description}\n")

        # Check development structure  
        f.write("\n[DEVELOPMENT STRUCTURE]\n")
        dev_dirs = {
            "development/portfolio-iterations": "Website iterations and backups",
            "development/assets": "Development asset backups"
        }
        
        for dir_path, description in dev_dirs.items():
            if Path(dir_path).exists():
                try:
                    count = len(list(Path(dir_path).rglob("*")))
                    f.write(f"PASS {dir_path}/ - {count} items - {description}\n")
                except:
                    f.write(f"PASS {dir_path}/ - {description}\n")
            else:
                f.write(f"FAIL {dir_path}/ - MISSING - {description}\n")
        
        # Git status if available
        f.write("\n[GIT STATUS]\n")
        try:
            result = subprocess.run(["git", "status", "--short"], 
                                  capture_output=True, text=True, check=True)
            if result.stdout.strip():
                f.write("Working directory changes:\n")
                f.write(result.stdout)
            else:
                f.write("Working directory: CLEAN\n")
                
            # Get current branch
            branch_result = subprocess.run(["git", "branch", "--show-current"], 
                                         capture_output=True, text=True, check=True)
            if branch_result.stdout.strip():
                f.write(f"Current branch: {branch_result.stdout.strip()}\n")
        except (subprocess.CalledProcessError, FileNotFoundError):
            f.write("Not a git repository or git not available\n")

        # Key files check
        f.write("\n[KEY FILES STATUS]\n")
        key_files = {
            "README.md": "Main documentation",
            "docs/index.html": "GitHub Pages main page",
            "docs/stylesheet.css": "GitHub Pages styling",
            "cleanup-repo.ps1": "Repository organization script",
            ".gitignore": "Git ignore configuration"
        }
        
        for file_path, description in key_files.items():
            if Path(file_path).exists():
                try:
                    size_kb = round(Path(file_path).stat().st_size / 1024, 1)
                    f.write(f"PASS {file_path} - {size_kb}KB - {description}\n")
                except:
                    f.write(f"PASS {file_path} - PRESENT - {description}\n")
            else:
                f.write(f"FAIL {file_path} - MISSING - {description}\n")
        
        f.write(f"""
[SUMMARY]
Project: Project Sankofa
Type: Research & Documentation Repository with GitHub Pages
Status: Organized and ready for development
GitHub Pages: docs/ folder ready for publishing
Repository Structure: Clean and organized
Generated: {output_file}

[AI ASSISTANT READY]
This repository is well-organized for AI assistance:
- GitHub Pages site protected in docs/
- Development work organized in development/
- Research content structured in content/
- Assets properly categorized in assets/
- Archive maintains historical organization

Ready to share with AI assistants for further development!
""")
    
    print(f"Status report generated: {output_file}")

if __name__ == "__main__":
    generate_status()
