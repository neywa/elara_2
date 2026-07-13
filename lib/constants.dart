import 'package:flutter/material.dart';

// SharedPreferences keys
const String kStoryIndexKey = 'storyIndex';
const String kLanguageKey = 'language';
const String kArtFocusModeKey = 'artFocusMode';
const String kSfxEnabledKey = 'sfxEnabled';
const String kMusicEnabledKey = 'musicEnabled';
const String kPageSfxEnabledKey = 'pageSfxEnabled';
const String kHasRequestedRatingAfterDay1Key = 'hasRequestedRatingAfterDay1';

// Story
const int kStartingNodeIndex = 100;
const int kDay2StartNodeIndex = 2000;
const String kMenuMusicTrack = 'bg_music_day_1.mp3';

// Rating
// Only used on iOS, where openStoreListing() cannot resolve the listing from
// the bundle id. Android resolves it from the package name.
const String kAppStoreId = '6762544782';

// Durations
const Duration kFadeDuration = Duration(seconds: 1);
const Duration kUiRevealDelay = Duration(milliseconds: 1500);
const Duration kTransitionDelay = Duration(seconds: 1);
const Duration kRatingNudgeDelay = Duration(milliseconds: 1500);
// Layout
const double kStoryPanelMaxHeightRatio = 0.75;

// Colors
const Color kDarkBrown = Color(0xFF3E2723);
const Color kOldLace = Color(0xFFFDF5E6);
const Color kPanelBackground = Color(0xEEFDF5E6);
