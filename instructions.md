# Budge Buddy – Flutter App Specification

## Overview
Build a cross-platform mobile application in Flutter called **Budge Buddy**, a walkie-talkie style app that allows users to send voice nudges to individuals or teams.

**Scope:** Frontend/UI only (no backend logic yet). Use mock data and placeholders.

---

## General Requirements
- Flutter (latest stable)
- Clean, scalable architecture
- Reusable widgets
- Centralized configs (colors, spacing, strings)
- Responsive and scrollable UI
- Structured navigation
- Ready for state management (Provider/Riverpod/Bloc)

---

## UI / Theme
- Style: Strava-inspired
- Accent color: `#2D5438`
- Minimal, modern design
- Subtle animations (e.g., ripple effect)

---

## Onboarding Flow (9 Screens)

### 1. Splash Screen
- Center logo
- App name below

### 2. Welcome Screen
- SVG illustration
- “Get Started” button

### 3. Login Screen
- Email, Password (toggle visibility)
- Forgot password
- Login button
- Divider + Google login

### 4. Sign Up Screen
- Email input
- Sign up button
- Divider + Google sign-up

### 5. Verification Screen
- 6-digit code input
- Submit button

### 6. Account Setup (Step 1)
- Username
- Password (min 8 chars)
- Confirm password

### 6b. Account Setup (Step 2)
- First name, Last name, Country, Age

### 7. Pricing Screen
- 3 selectable plans:
  - Free (default)
  - Plus
  - Pro
- Dynamic button: “Continue Free” / “Upgrade Now”

### 8. Payment Screen
- Payment methods:
  - GCash
  - Maya
  - Credit/Debit Card
- Dynamic inputs per method

### 9. Result Screen
- Success: Congratulations
- Failure: Retry → back to payment

**Back button starts from Screen 6**

---

## Main App Screens

### Global Layout
- Header:
  - Left: Profile
  - Right: Notifications
- Bottom Navbar:
  - Home
  - Teams
  - Quick Nudge
  - Settings

---

### 1. Dashboard
- Heatmap (GitHub-style)
- Cards: Streak, Teams count
- Upcoming sessions

### 2. Teams
- Add button (top-right)
- List with avatar, name, members, sessions
- Navigation to Team Channel / Add Team

### 3. Add Team
- Team name, profile picture
- Session date/time
- Add members via search (badges)

### 4. Team Channel
- Sessions list
- Member selector
- Walkie-talkie button with ripple animation
- Modes:
  - Voice (hold)
  - Reminder (tap)

### 5. Quick Nudge
- Same as Team Channel + team selector

### 6. Settings
- Profile card (edit button)
- Toggles:
  - Notifications
  - Microphone
  - Audio

### 7. Edit Profile
- Editable:
  - Profile picture
  - First name, Last name, Country, Age
- Non-editable:
  - Username

### 8. Notifications
- List of recent nudges

---

## Project Structure

```
lib/
 ├── core/
 │   ├── constants/
 │   ├── theme/
 │   ├── utils/
 │
 ├── shared/
 │   ├── widgets/
 │   ├── components/
 │
 ├── features/
 │   ├── onboarding/
 │   ├── dashboard/
 │   ├── teams/
 │   ├── nudge/
 │   ├── settings/
 │
 ├── navigation/
 │   ├── app_router.dart
 │
 └── main.dart
```

---

## Configurability
- Centralized:
  - Colors
  - Typography
  - Spacing
  - Strings
- Reusable components:
  - Buttons
  - Inputs
  - Cards
  - Headers
  - Navbar

---

## Notes
- Use mock data
- No backend yet
- Clean, maintainable code
- Ready for future API integration

---

## Optional
- Dark mode
- Localization
- State management integration
