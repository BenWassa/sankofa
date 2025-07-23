# Project Sankofa

## Executive Snapshot

### Purpose

Project Sankofa is a multi-format, mythic-psychology research and storytelling initiative tackling the **Modern Meaning Crisis**—why so many young people feel lost, disconnected, and hungry for purpose.

---

## Repository Structure 

This repository is organized to separate the published GitHub Pages site from development assets and research content:

### 📁 `/docs` - GitHub Pages Site
**IMPORTANT**: This folder contains the live GitHub Pages website and should never be renamed or have its structure changed.
- `index.html` - Main website
- `stylesheet.css` - Site styling  
- Media assets for the live site (images, audio, PDF)
- **This folder is what visitors see at your GitHub Pages URL**

#### Active Webpage Outputs (`docs/index.html`)
The published site includes:
- **Hero Section**: Project tagline, translation, and mission statement
- **Navigation**: Home, About, Podcast, Brief, Visuals
- **About Section**: Project overview and research summary
- **Podcast Section**: Embedded audio player for "Episode 1: The Modern Meaning Crisis" (`Project Sankofa.mp3`)
- **Executive Brief Section**: Downloadable PDF summary (`Executive Brief.pdf`)
- **Visual Library**: Visual cards for Archetype Wheel (`A - final_SVG.svg`), Synthesis Map (`synthesis-map.svg`), and Meaning Framework (`meaning-framework.svg`)
- **Archetypes Section**: Overview of the three solution archetypes with supporting image (`A - final_PNG.png`)
- **Footer**: Credits, proverb, and design note

### 📁 `/development` - Development Assets
All development iterations, prototypes, and working files:
- `portfolio-iterations/` - All website iterations (Claude, Gemini versions, backups)
- `assets/` - Development assets and backup files

### 📁 `/content` - Research & Documentation  
Organized research materials and project documentation:
- `briefs/` - Executive briefs, production documents, synthesis maps
- `commissioning/` - Project commissioning and requirements documents
- `research/` - Research inputs, raw findings, and analysis

### 📁 `/assets` - Organized Media Files
Production-ready media files organized by type:
- `images/` - Visual assets, including archetype wheels and graphics
- `audio/` - Audio content including podcast episodes
- `documents/` - Document assets and PDFs

### 📁 `/utilities` - Tools & Scripts
Scripts and tools for repository management:
- `cleanup-repo.ps1` - Repository organization script
- `generate-status.bat` / `generate-status.ps1` - Repository status snapshot utility

### 📁 `/archive` - Historical Organization
Previous organizational structure preserved for reference:
- Numbered folders (`01-core`, `02-assets`, etc.)
- Template consolidation materials

---

### What’s Been Done

- **7-part deep research run**: Mapped the decline of meaning frameworks, tech/dopamine traps, impacts on youth, reframing pain, practices for depth, secular moral development, and rebuilding community rituals.
- **Synthesis Map**: Identified patterns, tensions, evidence gaps, and three solution archetypes:
  - *The Inner Architect* (self-meaning)
  - *The Community Weaver* (rebuilding bonds)
  - *The Wisdom Integrator* (ancient + modern coherence)
- **Cinematic Cold Open**: Narrative hook for podcast/keynote.
- **2-page Executive Brief**: Structured, citation-backed summary for funders, educators, and policy allies ([PDF](Production%20Docs/Executive%20Brief%20-%20Project%20Sankofa.pdf)).
- **Portfolio Page**: Modern, mythic-themed web showcase integrating:
  - **Podcast Section**: First episode, "The Modern Meaning Crisis," with integrated audio player ([Project Sankofa.mp3](Portfolio%20Page/Media/Project%20Sankofa.mp3)).
  - **Visual Library**: Features the Archetype Wheel, Synthesis Map, and Meaning Framework as interactive visual cards.
  - **Responsive Navigation**: Clean, accessible nav with dividers and animated Sankofa icon.
  - **About & Archetypes**: Three archetype features displayed in a responsive grid.
- **Styling**: Custom CSS (`stylesheet v3 Claude.css`) with ancient-mythic palette, gold/bronze accents, parchment textures, and modern accessibility. Fully responsive and accessible.
- **Background Update**: Updated Sankofa background image to SVG format and expanded on Canva to fit the page better. The new background provides improved visual coverage and maintains theme consistency. (See `Portfolio Page/Media/Sankofa_back_SVG.svg`)
- **Hero Actions**: Cleaned up the hero actions section for a minimal, theme-consistent design with subtle divider styling that disappears on mobile.
- **NotebookLM Library**: Tagged knowledge base for ongoing querying and future expansions.

---

### What’s Next

1. **Expand the Podcast**
   - Plan and produce additional episodes, deepening the mythic-psychology narrative.
   - Integrate more research voices and lived experience.
2. **Portfolio Page Enhancements**
   - Add more interactive and accessible features for audio and visuals.
   - Continue refining navigation, mobile experience, and visual polish.
3. **Visual & Research Assets**
   - Develop new infographics and research summaries.
   - Expand the Visual Library and Brief sections.
4. **Community & Collaboration**
   - Invite feedback, partnerships, and new contributors.
   - Expand NotebookLM and knowledge base for future research.

---

### Key Strategic Tension

Balance *Story* and *Science*: Combine rigor and mythic emotional resonance so it hits the gut *and* stands up to scrutiny.

---

## Bottom Line

**Project Sankofa** is an intellectual ecosystem and narrative weapon to re-weave modern meaning, built on real research, delivered in compelling story form, and expandable for future products.

## Codebase Structure

```
sankofa/
├── Commissioning/
│   ├── Initial Page.md
│   ├── Style upgrades.md
├── Inputs/
│   └── all Distilled findings_raw.txt
├── Portfolio Page/
│   ├── Claude/
│   │   ├── index Claude v2.html
│   │   ├── stylesheet v3 Claude.css
│   │   └── old/
│   │       ├── index Claude v1.html
│   │       ├── Preview_Claude v1.pdf
│   │       ├── stylesheet v1 Claude.css
│   │       ├── stylesheet v2 Claude.css
│   ├── Gemini/
│   │   ├── index Gemini.html
│   │   ├── Preview_Gemini v1.pdf
│   │   ├── stylesheet v1 Gemini.css
│   ├── Media/
│   │   ├── image 2.png
│   │   ├── image1.jpg
│   │   ├── Project Sankofa.mp3
│   │   ├── Sankofa_icon.png
│   │   ├── Sora_sankofa_cover.png
│   │   ├── Architype wheel/
│   │   │   ├── A - final_PNG.png
│   │   │   ├── A - final_SVG.svg
│   │   │   ├── A-1.png
│   │   │   ├── A-2.png
│   │   │   ├── B-1.jpg
│   │   │   ├── B-2.png
│   │   │   ├── C-1.png
├── Production Docs/
│   ├── cinematic cold open.md
│   ├── Executive Brief - Project Sankofa.md
│   ├── Executive Brief.pdf
│   ├── Sankofa Synthesis Map.md
├── README.md
├── sankofa.code-workspace
```
