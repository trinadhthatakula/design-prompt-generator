---
name: design-prompt-generator
description: Use when you have an existing UI codebase (Jetpack Compose, SwiftUI, React, Flutter, etc.) and need to generate a structured design-prompt file to communicate the entire UI to Google Stitch, Claude Design, or any AI design tool. Use when modernizing UI, handing off to a designer, or bootstrapping a redesign from existing screens.
---

# Design Prompt Generator

## Overview

Analyzes all UI source files in a codebase, builds a dependency graph of composables/components and screens, then writes `DESIGN_PROMPTS.md` — a file where each section is a self-contained design prompt describing one component or screen, ordered so dependencies always come before the components that use them.

The output is ready to paste into Google Stitch or Claude Design, one section at a time.

---

## When to Use

- Modernizing an existing app UI with an AI design tool
- Communicating the full UI surface to a designer or design system
- Starting a redesign and need a structured brief per screen
- Auditing what UI components exist before a refactor

**Not for:** Greenfield UI (no existing code to analyze). Use a brainstorming skill instead.

---

## Process

### Step 1 — Discover

Find every UI file: screens, composables/components, theme files, navigation shell.

```shell
# Jetpack Compose
find . -path '*/ui/**/*.kt' -o -path '*/theme/**/*.kt' -o -path '*/navigation/**/*.kt'

# React
find . -path '*/components/**/*.tsx' -o -path '*/screens/**/*.tsx' -o -path '*/pages/**/*.tsx'

# Flutter
find . -path '*/widgets/**/*.dart' -o -path '*/screens/**/*.dart'
```

Group into layers:
1. **Theme / Design tokens** — colors, typography, motion
2. **Shared / Common components** — reusable across screens
3. **Sub-composables** — private or internal composables inside a screen file
4. **Screens / Pages** — top-level routed destinations

### Step 2 — Analyze Each File

For each file, extract:
- **All `@Composable` / component functions** (public and private), their signatures and dependencies
- **Layout structure**: what containers, lists, cards, dialogs are used
- **States handled**: loading, empty, error, success, and any conditional rendering
- **Interactions**: clicks, toggles, navigation callbacks, gestures
- **Typography/color roles** used (e.g., `headlineMedium`, `primaryContainer`)
- **Ad or paywall slots** if present

Use `grep -n 'fun '` (or equivalent) to list all functions first, then read the full file.

### Step 3 — Build Dependency Graph

For each screen, list which sub-composables and shared components it uses.
Sub-composables come before the screen that contains them.
Shared components come before everything that uses them.

```
ThemeFoundation
  └── SharedComponent A
  └── SharedComponent B (uses A)
  └── SubComposable X (used by Screen 1)
  └── Screen 1 → SubComposable X + SharedComponent A
  └── SubComposable Y (used by Screen 2)
  └── Screen 2 → SubComposable Y + SharedComponent B
```

### Step 4 — Write Prompts

Write one prompt section per component/screen, in dependency order.

**Prompt template:**

```markdown
### {N}.{M} — `ComponentName`
> File: `path/to/File.kt` · [private composable | shared component | screen]
> Uses: `Dep1`, `Dep2`   ← only if it has dependencies

Design a **[one-line description of what this UI element is]**.

[Layout description — top to bottom or primary axis. Be specific about containers,
spacing, alignment. Name Material components used (Card, TopAppBar, LazyColumn, etc.)]

[State descriptions — what changes visually between loading/empty/error/success states]

[Interaction notes — tap targets, animations, dialogs triggered]

[Color/typography role hints — e.g., "primary color for active item, onSurfaceVariant for labels"]
```

**Rules for prompt quality:**
- Write for a designer who has never seen the code — no Kotlin/Swift jargon
- Describe *what the user sees and does*, not how it's implemented
- Name Material 3 / design system components by their correct names (Card, BottomSheet, SearchBar, etc.)
- Include all visual states (loading skeleton, empty state, error, disabled)
- Mention ad slots, paywall gates, and Pro/free conditional sections explicitly

### Step 5 — Assemble `DESIGN_PROMPTS.md`

Structure:
```
# [App Name] — Design Prompts for [Tool Name]

> How to use: [one sentence]
> Design system: [theme name, default mode, palette seed, motion style]

---

## 0. Design System Foundation
### 0.1 — Theme

## 1. Common / Shared Components
### 1.1 — ComponentA
### 1.2 — ComponentB

## 2. [Feature Area] Screen
### 2.1 — SubComposableX   ← dependency first
### 2.2 — SubComposableY
### 2.3 — FeatureScreen    ← screen last, references 2.1 and 2.2

...

## Summary — Dependency Order
[ASCII or markdown tree showing full composition hierarchy]
```

Write the file to the **project root** as `DESIGN_PROMPTS.md`.

---

## Key Rules

- **Dependency order is mandatory.** A screen prompt must never appear before a prompt for a component it uses.
- **One section = one Stitch/Claude Design conversation turn.** Each section must be self-contained enough to paste in isolation.
- **Include the theme section first.** Design tools need the design system context before individual components.
- **Group by feature area**, not by file. Screens and their sub-composables belong in the same numbered group.
- **End with a dependency tree.** Lets the user verify order and understand composition at a glance.

---

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Writing screen prompt before its sub-composables | Always resolve the dependency graph first |
| Describing implementation details (StateFlow, ViewModel) | Describe only what appears on screen |
| Skipping empty/error states | These are real UI states — include them |
| Generic descriptions ("a card with some text") | Name the specific content, layout, and color roles |
| Omitting ad/paywall slots | These are visible UI elements — describe their size and position |
| One giant screen prompt with all sub-composables inline | Split each private composable into its own numbered section |
