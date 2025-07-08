# Project Sankofa Portfolio (v1)

A mythic, research-rooted hub: podcast • visuals • executive brief • story.

---

## ⚙️ Output Focus

*   One `index.html` file.
*   One `stylesheet.css` file.
*   No extra folders or `README` — all relative paths assume local.
*   Optional React-ready comment tags for later replacement with components.

---

## 🧭 Core Goals

1.  **Highly stylized but lightweight**: Clean semantic HTML5, modern CSS.
2.  **Ready for GitHub Pages static deploy**: No build step needed.
3.  **Fluid responsive layout**: Mobile, tablet, desktop.
4.  **Functional native `<audio>` tag**: Styled via CSS.
5.  **Placeholder blocks**: For real content later.
6.  **Optional**: Mark sections where React slots could later replace static bits.

---

## 📌 Sections to Generate

| Section        | HTML Element  | Notes                                                            |
| :------------- | :------------ | :--------------------------------------------------------------- |
| Hero           | `<header>`    | Tagline, mission, CTA buttons.                                   |
| Nav            | `<nav>`       | Home • Podcast • Visuals • Brief • About (anchors).            |
| Podcast        | `<section>`   | Native `<audio>` with dummy source, basic custom controls (styled). |
| Visual Library | `<section>`   | Placeholder `<img>`s with alt text.                              |
| Executive Brief| `<section>`   | Link to placeholder PDF.                                         |
| About          | `<section>`   | Short project blurb (filler text).                               |
| Footer         | `<footer>`    | Basic credits or placeholder.                                    |

---

## 🎨 Style Guidance

*   ✅ Deep, mythic dark theme — use CSS custom properties for colors.
*   ✅ Smooth hover/focus states for navigation and CTA buttons.
*   ✅ Responsive typography (fluid scaling).
*   ✅ Soft fade-in scroll effects if possible with CSS only.
*   ✅ Clean custom audio player styling (progress bar, play/pause, volume if simple).
*   ✅ Keep styling separate — **no inline styles**.

---

## 🧩 Optional React Placeholder Tags

Add clear HTML comments for potential React component slots:

```html
<!-- REACT_COMPONENT: SectionName -->
```

Specifically for:

*   Hero CTA
*   Podcast Player
*   Visual Library Cards
*   About Section

---

## 🗂️ File Path Assumptions

All paths are relative to `index.html`:

*   **Audio**: `audio/podcast.mp3`
*   **Images**: `images/archetype.svg`
*   **Brief**: `briefs/executive-brief.pdf`

---

## ⚡ What NOT to Include

*   🚫 No folder structure — just assume relative links.
*   🚫 No `README.md` or Markdown source files in the output.
*   🚫 No advanced JS frameworks — vanilla JavaScript only if truly needed for custom audio controls.

---

## ✅ Claude's Deliverable

Claude should output the following two files:

1.  `index.html`
    *   Fully valid semantic structure.
    *   `<link>` to `stylesheet.css` in the `<head>`.
    *   Navigation with working anchors (`#hero`, `#podcast`, etc.).
    *   Placeholder `<audio>` with controls.
    *   Example `<img>`s for visuals.
    *   Link to brief PDF.
    *   Clear `<!-- REACT_COMPONENT -->` tags where specified.

2.  `stylesheet.css`
    *   All styling: dark theme, accent colors, CSS variables.
    *   Responsive typography & layout.
    *   Basic audio player styling (target native `<audio>` elements).
    *   Hover/focus states.
    *   Smooth section fade-in with `@keyframes` or `scroll-behavior`.
    *   No external frameworks, keep it vanilla CSS.

---