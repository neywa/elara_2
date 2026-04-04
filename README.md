```
                          .
                         /|\
                        / | \
                       /  |  \
                      /   |   \
                 ____/    |    \____
                /    \    |    /    \
               /      \   |   /      \
              /  ~~~~  \  |  /  ~~~~  \
             /  ~~~~~~  \ | /  ~~~~~~  \
            /~~~~~~~~~~~~\|/~~~~~~~~~~~~\
           /       La Valle d'Oro        \
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       ~  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~  ~

              A U R A   O F   G O L D

          An interactive visual novel set
            in the heart of Tuscany
```

# Aura of Gold

An atmospheric interactive visual novel built with Flutter. Follow Elara, a burnt-out city professional who inherits her eccentric Aunt Bella's cottage in La Valle d'Oro — The Golden Valley. Across three story days, make choices that shape her journey of rediscovery, peace, and connection to the land.

## Features

- **Branching narrative** across 3 story days with 70+ story nodes
- **6 languages** — English, Czech, German, French, Italian, Spanish
- **Atmospheric audio** — background music per chapter, contextual sound effects
- **Art Focus mode** — hide the text to enjoy the illustrations fullscreen
- **Persistent progress** — save and resume your story
- **Animated UI** — fade transitions, scroll-aware text, audio control pill

## Screenshots

The game features rich, painterly illustrations of the Tuscan countryside paired with poetic narrative text and branching choices.

## Build & Run

```bash
flutter run                    # Run on connected device/emulator
flutter build apk              # Build Android APK
flutter build apk --release    # Release APK (requires key.properties)
flutter analyze                # Static analysis
```

## Architecture

```
lib/
  main.dart                    # Entry point, lifecycle observer
  constants.dart               # SharedPreferences keys, durations, colors
  ui_strings.dart              # Localized UI text, language cycling
  story_data.dart              # Aggregates chapters into Map<int, StoryNode>
  chapter_1.dart               # Day 1 story nodes (100-series)
  chapter_2.dart               # Day 2 story nodes (2000-series)
  chapter_3.dart               # Day 3 story nodes (3000-series)
  models/
    story_node.dart            # StoryNode + StoryContent typed models
  services/
    audio_service.dart         # Music/SFX management, toggle state
  screens/
    splash_screen.dart         # Animated splash with fade-to-gray
    menu_screen.dart           # Main menu + settings + audio pill
    story_screen.dart          # Story player with choices + transitions
```

### Data Flow

Raw story data lives in `chapter_1.dart`, `chapter_2.dart`, `chapter_3.dart` as `Map<int, Map<String, dynamic>>`. `story_data.dart` aggregates these and converts them into `Map<int, StoryNode>` via `StoryNode.fromMap()`, providing type-safe access in screens.

### Audio

- `AudioService` manages background music (looping) and SFX toggle state
- `AudioContext` is configured in `StoryScreen.initState` only (not in `main()` — moving it breaks Bluetooth routing)
- Music and SFX preferences persist across sessions via SharedPreferences
- App lifecycle observer pauses/resumes music when backgrounded

### Localization

Every story node contains language maps (`en`, `cs`, `de`, `fr`, `it`, `es`) with `text`, `choice1`, and optional `choice2`. The `StoryNode` model dynamically picks up any language key. UI strings are centralized in `ui_strings.dart`.

## The Story

```
  Day 1: Arrival
    The bus drops Elara at the ridge overlooking
    the valley. She descends to the village,
    finds Bella's cottage, and settles in.

  Day 2: Discovery
    Elara explores the village, meets Sofia at
    the cafe, finds Old Marco at the market,
    and tends to Bella's garden.

  Day 3: Secrets
    The attic trunk, a hand-drawn map, ancient
    legends, and a hidden sanctuary reveal the
    valley's deepest mysteries.
```

## License

Private project.

```
        *  .  *
     .    _/\_    .
      *  /    \  *
   .    / ~  ~ \    .
       /~~~~~~~~\
  ~~~~~~~~~~~~~~~~~~~~
      Aura of Gold
  ~~~~~~~~~~~~~~~~~~~~
```
