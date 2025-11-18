# **Commission Document — Project Sankofa Interactive Visual Experience**

## **Context**

Project Sankofa explores the modern **Meaning Crisis** across seven structured research questions (Q1–Q7). Each question has been distilled into modular Markdown exports containing:

* **Causes**
* **Impacts**
* **Gaps**
* **Solutions**
* **Storytelling Bridges**

Together, these form a **systemic map** of the crisis: causes feed into impacts, gaps highlight failures of existing responses, solutions suggest paths forward, and storytelling bridges provide mythic/psychological resonance.

The design team’s task is to transform this structured knowledge into a **navigable, interactive, and emotionally engaging experience** that works directly on a static site (GitHub Pages), without requiring Node.js or server-side code.

---

## **Vision**

The interactive experience should balance **analytic clarity** and **mythic resonance**, allowing a user to:

1. **See the big picture** — how the seven questions interlock into a “cause → impact → solution → story” pathway.
2. **Dive into details** — drill down into each question’s structured categories.
3. **Feel the resonance** — encounter **storytelling bridges** (myths, metaphors, archetypes) that give emotional weight to the material.

The end result should feel like a **living map of meaning**, not just an academic diagram.

---

## **Design Priorities**

1. **Interactivity**

   * Nodes and clusters should be clickable and expandable.
   * Hover states or tooltips should reveal category-level insights.
   * Users should feel they can explore and trace connections.

2. **Structure**

   * A master pathway flow (Cause → Impact → Gap → Solution → Storytelling).
   * Modular breakdown by Q1–Q7 (each question as its own cluster/subgraph).
   * Storytelling bridges shown as overlays or symbolic icons (e.g., Sirens, Phoenix, Tower of Babel).

3. **Aesthetic**

   * Minimalist, mythic, premium feel.
   * Gold-accented highlights on a dark background.
   * Rounded, organic node design (avoid sterile “corporate” look).
   * Typography: clean sans-serif (e.g., Inter) with strong contrast.

4. **Narrative Flow**

   * Users should sense a **journey**: starting with the wound, moving through collapse and temptations, encountering crucibles, and finding practices, codes, and community.
   * Optional “hero’s journey” framing (progressive discovery across Q1–Q7).

---

## **Technical Constraints**

* Must run **client-side only** (static HTML/CSS/JS on GitHub Pages).
* No Node.js builds, server hosting, or backend dependencies.
* Acceptable tools:

  * Plain HTML/CSS/JS.
  * Libraries via CDN (e.g., D3.js, Cytoscape.js).
  * `<details>`/`<summary>` accordions for fallback.
* Should be mobile-friendly and performant without heavy frameworks.

---

## **Seeding Vision**

* **Master Map:** A **flow diagram** or **sunburst** that shows the structure of the meaning crisis (cause → impact → solution → story). This should be the “hub” view.
* **Modular Maps:** Each Q1–Q7 has its own **sub-map** that users can click into.
* **Storytelling Layer:** Myths and metaphors appear as **icons/nodes** that glow or animate on hover, opening short narrative vignettes.
* **Exploration Modes:**

  * **Overview Mode:** See all questions together.
  * **Focused Mode:** Expand one question and its categories in detail.

---

## **Deliverables**

1. **Prototype Visualization**

   * A working HTML/CSS/JS file with sample data from one question (e.g., Q1).
   * Demonstrates node interactivity, expand/collapse, and storytelling overlays.

2. **Design System**

   * Style guide: colors, fonts, node shapes, hover animations, transitions.
   * Iconography for storytelling bridges.

3. **Scalable Framework**

   * Clear method for adding Q2–Q7 data into the system.
   * Lightweight JSON or Markdown parser if needed.

4. **Fallback**

   * A non-interactive version (accordion outline) as accessibility fallback.

---

## **References**

* Content base: **GraphExports Q1–Q7** (Markdown files).
* Current GitHub Pages stack (HTML + Markdown).
* Existing visual experiments in Cytoscape.js and D3.js (seed scaffolds available).

---

🔑 **Core ask**: Create an **interactive visual map of the Meaning Crisis** that works without servers or builds, honors the depth of the content, and invites both analytic exploration and mythic storytelling.
