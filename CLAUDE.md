# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Run Commands

```bash
flutter run                    # Run on connected device/emulator
flutter build apk              # Build Android APK
flutter build apk --release    # Build release APK (requires key.properties)
flutter analyze                # Run static analysis (uses flutter_lints)
flutter test                   # Run tests
```

Android release signing is configured via `android/key.properties` (not committed).

## Architecture

**"Aura of Gold"** — an interactive visual novel / branching story game built with Flutter. The player follows Elara through a Tuscan valley across 3 story days, making choices that branch the narrative. Supports English and Czech.

### Data Flow

Raw story data lives in `chapter_1.dart`, `chapter_2.dart`, `chapter_3.dart` as `Map<int, Map<String, dynamic>>` keyed by node index (100-series = day 1, 2000-series = day 2, 3000-series = day 3). `story_data.dart` aggregates these and converts them into `Map<int, StoryNode>` via `StoryNode.fromMap()`, providing type-safe access in screens.

### Key Components

- **`AudioService`** (`services/audio_service.dart`) — singleton managing background music player, music/SFX toggle state, and art focus mode. Passed via constructor injection to both screens. The app-level `WidgetsBindingObserver` in `main.dart` pauses/resumes music on app lifecycle changes.
- **`StoryNode` / `StoryContent`** (`models/story_node.dart`) — typed model wrapping story data. `contentFor(lang)` returns localized text/choices.
- **`StoryScreen`** (`screens/story_screen.dart`) — main gameplay screen. Uses `AnimationController` for text panel fade and audio panel fade (requires `TickerProviderStateMixin`). Scroll-aware `ShaderMask` fades bottom text only when more content exists below.
- **`MainMenuScreen`** (`screens/menu_screen.dart`) — menu with settings submenu (language, SFX, art focus mode).
- **`constants.dart`** — SharedPreferences keys, durations, colors, layout values.

### Audio Setup

`AudioContext` (Android/iOS audio routing config) is set in `StoryScreen.initState` only — not in `main()`. Moving it to `main()` breaks Bluetooth audio routing. The `audioplayers` package's `setVolume()` before `play()` can prevent audio from starting on Android — always play first, then adjust volume.

### Persistence

Uses `SharedPreferences` for: story progress (`storyIndex`), language, art focus mode, SFX enabled. All async prefs calls are wrapped in try-catch with `mounted` guards before `setState`.

### Bilingual System

Every story node contains `en` and `cs` maps with `text`, `choice1`, and optional `choice2`. UI strings in screens use inline ternaries on `_currentLang`.
