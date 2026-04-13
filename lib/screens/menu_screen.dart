import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import '../constants.dart';
import '../services/audio_service.dart';
import '../ui_strings.dart';
import 'story_screen.dart';

class MainMenuScreen extends StatefulWidget {
  final AudioService audioService;

  const MainMenuScreen({super.key, required this.audioService});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> with SingleTickerProviderStateMixin {
  bool _hasSavedGame = false;
  String _currentLang = 'en';
  bool _isSettingsMenuOpen = false;
  bool _isAudioPanelOpen = false;
  late AnimationController _audioPanelController;
  late Animation<double> _audioPanelAnimation;
  final AudioPlayer _sfxPlayer = AudioPlayer();

  AudioService get _audio => widget.audioService;

  @override
  void initState() {
    super.initState();

    _audioPanelController = AnimationController(
      vsync: this,
      duration: kFadeDuration,
    );

    _audioPanelAnimation = CurvedAnimation(
      parent: _audioPanelController,
      curve: Curves.easeInOut,
    );

    _initAudio();
  }

  Future<void> _initAudio() async {
    await _checkSavedProgress();
    _audio.changeMusic(kMenuMusicTrack);
  }

  @override
  void dispose() {
    _audioPanelController.dispose();
    _sfxPlayer.dispose();
    super.dispose();
  }

  void _playMenuSfx() {
    if (!_audio.isSfxEnabled) return;
    try {
      _sfxPlayer.play(AssetSource('audio/menu.mp3'));
    } catch (e) {
      debugPrint('Error playing menu SFX: $e');
    }
  }

  void _toggleLanguage() async {
    setState(() {
      _currentLang = nextLanguage(_currentLang);
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(kLanguageKey, _currentLang);
    } catch (e) {
      debugPrint('Error saving language preference: $e');
    }
  }

  void _toggleMusic() async {
    _audio.toggleMusic();
    setState(() {});
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kMusicEnabledKey, _audio.isMusicPlaying);
    } catch (e) {
      debugPrint('Error saving music preference: $e');
    }
  }

  void _toggleSfx() async {
    setState(() {
      _audio.isSfxEnabled = !_audio.isSfxEnabled;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kSfxEnabledKey, _audio.isSfxEnabled);
    } catch (e) {
      debugPrint('Error saving SFX preference: $e');
    }
  }

  void _togglePageSfx() async {
    setState(() {
      _audio.isPageSfxEnabled = !_audio.isPageSfxEnabled;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kPageSfxEnabledKey, _audio.isPageSfxEnabled);
    } catch (e) {
      debugPrint('Error saving page SFX preference: $e');
    }
  }

  void _toggleAudioPanel() {
    if (_isAudioPanelOpen) {
      _audioPanelController.reverse().then((_) {
        if (mounted) setState(() => _isAudioPanelOpen = false);
      });
    } else {
      setState(() => _isAudioPanelOpen = true);
      _audioPanelController.forward();
    }
  }

  Future<void> _checkSavedProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedIndex = prefs.getInt(kStoryIndexKey) ?? kStartingNodeIndex;

      if (!mounted) return;
      setState(() {
        _currentLang = prefs.getString(kLanguageKey) ?? 'en';
        _audio.artFocusMode = prefs.getBool(kArtFocusModeKey) ?? false;
        _audio.isSfxEnabled = prefs.getBool(kSfxEnabledKey) ?? true;
        _audio.isPageSfxEnabled = prefs.getBool(kPageSfxEnabledKey) ?? true;
        _audio.isMusicPlaying = prefs.getBool(kMusicEnabledKey) ?? true;
        if (savedIndex > kStartingNodeIndex) {
          _hasSavedGame = true;
        }
      });
    } catch (e) {
      debugPrint('Error loading saved progress: $e');
    }
  }

  void _showAboutDialog() {
    _playMenuSfx();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFDF5E6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Aura of Gold',
          style: TextStyle(color: kDarkBrown, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'v1.0.0',
              style: TextStyle(color: kDarkBrown, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              ui('aboutDescription', _currentLang),
              style: TextStyle(color: kDarkBrown, fontSize: 15, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              '${ui('aboutFeedback', _currentLang)}:',
              style: TextStyle(color: kDarkBrown, fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'neywa.blake@gmail.com',
              style: TextStyle(color: kDarkBrown, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => launchUrl(Uri.parse('https://buymeacoffee.com/neywablake')),
              child: Text(
                'Buy me a coffee ☕',
                style: TextStyle(
                  fontSize: 15,
                  color: kDarkBrown,
                  decoration: TextDecoration.underline,
                  decorationColor: kDarkBrown,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: 0.9),
                  foregroundColor: kDarkBrown,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  side: const BorderSide(color: kDarkBrown, width: 1),
                ),
                onPressed: () {
                  _playMenuSfx();
                  Navigator.pop(context);
                },
                child: Text(
                  ui('back', _currentLang),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
    // Play SFX on a separate player so it survives the screen transition
    if (_audio.isSfxEnabled) {
      final sfx = AudioPlayer();
      sfx.play(AssetSource('audio/menu.mp3'));
      sfx.onPlayerComplete.listen((_) => sfx.dispose());
    }

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
            child: GestureDetector(
              onTap: () {
                if (_isAudioPanelOpen) {
                  _audioPanelController.reverse().then((_) {
                    if (mounted) setState(() => _isAudioPanelOpen = false);
                  });
                }
              },
              child: Image.asset(
                'assets/images/elara_menu.jpg',
                fit: BoxFit.cover,
                semanticLabel: 'Title screen background showing the Golden Valley',
              ),
            ),
          ),

          Positioned.fill(
            child: Container(color: Colors.white.withValues(alpha: 0.25)),
          ),

          Positioned(
            top: 40,
            right: 20,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_isAudioPanelOpen)
                  FadeTransition(
                    opacity: _audioPanelAnimation,
                    child: Container(
                      height: 48,
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: kDarkBrown, width: 1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _panelToggle(
                            icon: Icons.music_note,
                            tooltip: 'Toggle music',
                            isEnabled: _audio.isMusicPlaying,
                            onPressed: _toggleMusic,
                          ),
                          const SizedBox(width: 2),
                          _panelToggle(
                            icon: Icons.spatial_audio_off,
                            tooltip: 'Toggle sound effects',
                            isEnabled: _audio.isSfxEnabled,
                            onPressed: _toggleSfx,
                          ),
                          const SizedBox(width: 2),
                          _panelToggle(
                            icon: Icons.auto_stories,
                            tooltip: 'Toggle page turn sound',
                            isEnabled: _audio.isPageSfxEnabled,
                            onPressed: _togglePageSfx,
                          ),
                        ],
                      ),
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                    border: Border.all(color: kDarkBrown, width: 1),
                  ),
                  child: IconButton(
                    tooltip: 'Audio settings',
                    icon: Icon(
                      (_audio.isMusicPlaying || _audio.isSfxEnabled)
                          ? Icons.volume_up
                          : Icons.volume_off,
                      color: kDarkBrown,
                    ),
                    onPressed: _toggleAudioPanel,
                  ),
                ),
              ],
            ),
          ),

          Align(
            alignment: const Alignment(0.0, -0.67),
            child: const Text(
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
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (!_isSettingsMenuOpen) ...[
                        if (_hasSavedGame) ...[
                          _menuButton(
                            label: ui('continue', _currentLang),
                            onPressed: () => _startGame(isNewGame: false),
                            playSfx: false,
                          ),
                          const SizedBox(height: 20),
                        ],
                        _menuButton(
                          label: ui('newGame', _currentLang),
                          onPressed: () => _startGame(isNewGame: true),
                          playSfx: false,
                        ),
                        const SizedBox(height: 20),
                        _menuButton(
                          label: ui('settings', _currentLang),
                          onPressed: () => setState(() => _isSettingsMenuOpen = true),
                        ),
                        const SizedBox(height: 20),
                        _menuButton(
                          label: ui('exitGame', _currentLang),
                          onPressed: () => SystemNavigator.pop(),
                        ),
                      ] else ...[
                        _menuButton(
                          label: languageNames[_currentLang] ?? _currentLang,
                          onPressed: _toggleLanguage,
                        ),
                        const SizedBox(height: 20),
                        _menuButton(
                          label: _audio.artFocusMode
                              ? ui('artFocus', _currentLang)
                              : ui('storyFocus', _currentLang),
                          onPressed: _toggleArtMode,
                        ),
                        const SizedBox(height: 20),
                        _menuButton(
                          label: ui('about', _currentLang),
                          onPressed: _showAboutDialog,
                        ),
                        const SizedBox(height: 20),
                        _menuButton(
                          label: ui('back', _currentLang),
                          onPressed: () => setState(() => _isSettingsMenuOpen = false),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuButton({required String label, required VoidCallback onPressed, bool playSfx = true}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.9),
        foregroundColor: kDarkBrown,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        side: const BorderSide(color: kDarkBrown, width: 1),
      ),
      onPressed: () {
        if (playSfx) _playMenuSfx();
        onPressed();
      },
      child: Text(label, style: const TextStyle(fontSize: 20)),
    );
  }

  Widget _panelToggle({
    required IconData icon,
    required bool isEnabled,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      tooltip: tooltip,
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
      iconSize: 24,
      icon: Icon(
        icon,
        color: isEnabled ? kDarkBrown : kDarkBrown.withValues(alpha: 0.3),
      ),
      onPressed: onPressed,
    );
  }
}
