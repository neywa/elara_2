import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../services/audio_service.dart';
import 'story_screen.dart';

class MainMenuScreen extends StatefulWidget {
  final AudioService audioService;

  const MainMenuScreen({super.key, required this.audioService});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  bool _hasSavedGame = false;
  String _currentLang = 'en';
  bool _isSettingsMenuOpen = false;

  AudioService get _audio => widget.audioService;

  @override
  void initState() {
    super.initState();
    _checkSavedProgress();
    _audio.changeMusic(kMenuMusicTrack);
  }

  void _toggleLanguage() async {
    setState(() {
      _currentLang = (_currentLang == 'en') ? 'cs' : 'en';
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(kLanguageKey, _currentLang);
    } catch (e) {
      debugPrint('Error saving language preference: $e');
    }
  }

  void _toggleMusic() {
    _audio.toggleMusic();
    setState(() {});
  }

  Future<void> _checkSavedProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedIndex = prefs.getInt(kStoryIndexKey) ?? kStartingNodeIndex;

      if (!mounted) return;
      setState(() {
        _currentLang = prefs.getString(kLanguageKey) ?? 'en';
        _audio.artFocusMode = prefs.getBool(kArtFocusModeKey) ?? false;
        if (savedIndex > kStartingNodeIndex) {
          _hasSavedGame = true;
        }
      });
    } catch (e) {
      debugPrint('Error loading saved progress: $e');
    }
  }

  void _toggleArtMode() async {
    setState(() {
      _audio.artFocusMode = !_audio.artFocusMode;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kArtFocusModeKey, _audio.artFocusMode);
    } catch (e) {
      debugPrint('Error saving art mode preference: $e');
    }
  }

  Future<void> _startGame({required bool isNewGame}) async {
    try {
      if (isNewGame) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt(kStoryIndexKey, kStartingNodeIndex);
      }
    } catch (e) {
      debugPrint('Error saving new game state: $e');
    }

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => StoryScreen(audioService: _audio),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/title.jpg',
              fit: BoxFit.cover,
              semanticLabel: 'Title screen background showing the Golden Valley',
            ),
          ),

          Positioned.fill(
            child: Container(color: Colors.black.withValues(alpha: 0.3)),
          ),

          Positioned(
            top: 40,
            right: 20,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black45,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                tooltip: _audio.isMusicPlaying ? 'Mute music' : 'Unmute music',
                icon: Icon(
                  _audio.isMusicPlaying ? Icons.volume_up : Icons.volume_off,
                  color: Colors.white,
                ),
                onPressed: _toggleMusic,
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Aura of Gold",
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    letterSpacing: 2.0,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black87,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 80),

                if (!_isSettingsMenuOpen) ...[
                  if (_hasSavedGame) ...[
                    _menuButton(
                      label: _currentLang == 'en' ? "Continue" : "Pokračovat",
                      onPressed: () => _startGame(isNewGame: false),
                    ),
                    const SizedBox(height: 20),
                  ],
                  _menuButton(
                    label: _currentLang == 'en' ? "New Game" : "Nová hra",
                    onPressed: () => _startGame(isNewGame: true),
                  ),
                  const SizedBox(height: 20),
                  _menuButton(
                    label: _currentLang == 'en' ? "Settings" : "Nastavení",
                    onPressed: () => setState(() => _isSettingsMenuOpen = true),
                  ),
                  const SizedBox(height: 20),
                  _menuButton(
                    label: _currentLang == 'en' ? "Exit Game" : "Ukončit hru",
                    onPressed: () => SystemNavigator.pop(),
                  ),
                ] else ...[
                  _menuButton(
                    label: _currentLang == 'en' ? "Language: English" : "Jazyk: Čeština",
                    onPressed: _toggleLanguage,
                  ),
                  const SizedBox(height: 20),
                  _menuButton(
                    label: _currentLang == 'en'
                        ? (_audio.artFocusMode ? "Mode: Art Focus" : "Mode: Story Focus")
                        : (_audio.artFocusMode ? "Režim: Obraz" : "Režim: Příběh"),
                    onPressed: _toggleArtMode,
                  ),
                  const SizedBox(height: 20),
                  _menuButton(
                    label: _currentLang == 'en' ? "Back" : "Zpět",
                    onPressed: () => setState(() => _isSettingsMenuOpen = false),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuButton({required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.9),
        foregroundColor: kDarkBrown,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(fontSize: 20)),
    );
  }
}
