# Design Prompt Generator (AI Skill)

🚀 **Convert your existing UI codebase into structured design prompts for AI design tools (Google Stitch, Claude Design, and all LLMs!).**

This skill connects to an existing UI project (Jetpack Compose, React, Flutter, SwiftUI, etc.) and generates a comprehensive `DESIGN_PROMPTS.md` file. This generated file provides structural, self-contained design prompts ready to be fed into any AI design tool to clone, modernize, or redesign your UI.

## 🎯 Main Target

The primary objective of this skill is to **convert UI code into natural language design prompts** that can be effortlessly understood by **Google Stitch**, **Claude Design**, and **ANY Large Language Model (LLM)**. 

Whether you're looking to migrate a legacy app, hand off existing screens to a designer, or envision how your app looks in a brand-new design system, this tool bridges the gap between raw code and AI-driven UI generation.

## ✨ Features

- **Universal LLM Compatibility**: The output is purely structural, well-formatted markdown. It is readily understood by ChatGPT, Claude, Gemini, and any other top-tier LLM.
- **Dependency-Aware Generation**: Automatically resolves your project's component tree. It surfaces shared components and sub-composables before the screens that use them, ensuring your LLM understands the atomic parts before building the whole page.
- **State & Interaction Extraction**: Captures loading, error, empty, and success states alongside crucial interactions directly from your source code.
- **Multi-Framework**: Agnostic to your tech stack. It works seamlessly out-of-the-box with Jetpack Compose, React, Flutter, and more.
- **Zero-Jargon Output**: Translates complex framework-specific code/logic into clean, descriptive visual instructions that any designer (or AI designer) can comprehend.

## 📥 Installation

You can install this skill into your AI coding assistant workspace in two ways:

### Using `openskill` (Recommended)
Run the following npx command in your workspace terminal to install directly from this repository:
```bash
npx openskill install trinadhthatakula/design-prompt-generator
```

### Manual Installation
1. Create a `skills/design-prompt-generator` directory in your workspace or assistant configuration folder.
2. Download and copy the `SKILL.md` file from this repository into the newly created directory.

## 🛠️ How to Use

Once the skill is installed in an AI Coding Assistant capable of utilizing skills:

1. Instruct your assistant to: *"Use the `design-prompt-generator` skill on this codebase."*
2. The AI will traverse your codebase, analyze UI files, and deposit a cleanly structured `DESIGN_PROMPTS.md` at the root of your project.
3. Open the file, and copy sections sequentially into Google Stitch, Claude Design, or your preferred LLM to visually regenerate or iterate on the designs!

## 📦 What Gets Generated?

A `DESIGN_PROMPTS.md` file featuring:
1. **Design System Foundation**: Themes, colors, typography.
2. **Common / Shared Components**: Reusable pieces across the app.
3. **Screen Breakdown**: Each feature isolated into its own conversational turn, mapped logically.
4. **Dependency Tree**: A clear ASCII tree summarizing the full UI hierarchy and composition boundaries.

## 🤝 Contribution
Feel free to open issues or PRs to improve framework support or prompt output quality!

## 📄 License
MIT License
