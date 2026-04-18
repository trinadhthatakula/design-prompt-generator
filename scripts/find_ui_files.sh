#!/bin/bash
# A quick helper script to locate all UI files in an existing project.
# To be run from the root of a target project directory when using the design-prompt-generator skill.

echo "🔎 Looking for Jetpack Compose UI files..."
find . -path '*/ui/**/*.kt' -o -path '*/theme/**/*.kt' -o -path '*/navigation/**/*.kt' 2>/dev/null | grep -v 'build/'

echo ""
echo "🔎 Looking for React/Next.js UI files..."
find . -path '*/components/**/*.tsx' -o -path '*/screens/**/*.tsx' -o -path '*/pages/**/*.tsx' -o -path '*/components/**/*.jsx' 2>/dev/null | grep -v 'node_modules/'

echo ""
echo "🔎 Looking for Flutter UI files..."
find . -path '*/widgets/**/*.dart' -o -path '*/screens/**/*.dart' 2>/dev/null | grep -v '.dart_tool/'

echo ""
echo "🔎 Looking for SwiftUI files..."
find . -name '*.swift' 2>/dev/null | grep -iE 'view|screen|components' | grep -v 'DerivedData/'

echo ""
echo "✅ Analysis complete."
