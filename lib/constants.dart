import 'package:flutter/material.dart';

// SharedPreferences keys
const String kStoryIndexKey = 'storyIndex';
const String kLanguageKey = 'language';
const String kArtFocusModeKey = 'artFocusMode';
const String kSfxEnabledKey = 'sfxEnabled';
const String kMusicEnabledKey = 'musicEnabled';
const String kPageSfxEnabledKey = 'pageSfxEnabled';

// Story
const int kStartingNodeIndex = 100;
const String kMenuMusicTrack = 'bg_music_day_1.mp3';

// Durations
const Duration kFadeDuration = Duration(seconds: 1);
const Duration kUiRevealDelay = Duration(milliseconds: 1500);
const Duration kTransitionDelay = Duration(seconds: 1);
// Layout
const double kStoryPanelMaxHeightRatio = 0.75;

// Colors
const Color kDarkBrown = Color(0xFF3E2723);
const Color kOldLace = Color(0xFFFDF5E6);
const Color kPanelBackground = Color(0xEEFDF5E6);
