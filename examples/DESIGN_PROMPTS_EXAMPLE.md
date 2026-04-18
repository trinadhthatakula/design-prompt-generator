# App Name — Design Prompts for Tool Name

> How to use: Paste each section into your AI design tool sequentially.
> Design system: Material 3, dynamic color disabled, smooth motion.

---

## 0. Design System Foundation
### 0.1 — Theme
> File: `app/src/main/java/com/example/ui/theme/Theme.kt`

Design the **Foundation Theme** for the entire application.

- Primary colors: deep blue (#1A73E8) and surface white.
- Typography: Use inter font family, large prominent titles.

## 1. Common / Shared Components
### 1.1 — PrimaryButton
> File: `app/src/main/java/com/example/ui/components/PrimaryButton.kt` · [shared component]

Design a **Primary Action Button**.

[Layout description: It should be a pill-shaped button with a solid primary background and white text. It must support disabled and pressed states.]

## 2. Feature Area Screen
### 2.1 — UserAvatar
> File: `app/src/main/java/com/example/ui/screens/profile/ProfileScreen.kt` · [private composable]

Design a **Circular User Avatar**.

[Layout description: Shows an image inside a circle with a 2dp primary color border.]

### 2.2 — ProfileScreen
> File: `app/src/main/java/com/example/ui/screens/profile/ProfileScreen.kt` · [screen]
> Uses: `PrimaryButton`, `UserAvatar`

Design a **User Profile Screen**.

[Layout description: 
- A TopAppBar with the title "Profile".
- Below it, center a `UserAvatar`.
- Below it, display the user's name as a large headline.
- At the bottom, place a `PrimaryButton` saying "Log Out".]

---

## Summary — Dependency Order
```
Theme
  └── PrimaryButton
  └── UserAvatar
  └── ProfileScreen
```
