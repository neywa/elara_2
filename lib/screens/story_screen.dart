import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import '../constants.dart';
import '../models/story_node.dart';
import '../services/audio_service.dart';
import '../story_data.dart';
import '../ui_strings.dart';
import 'menu_screen.dart';

class StoryScreen extends StatefulWidget {
  final AudioService audioService;

  const StoryScreen({super.key, required this.audioService});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> with TickerProviderStateMixin {
  bool _isUiVisible = true;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  int _currentIndex = 0;
  String _currentLang = 'en';
  final ScrollController _textScrollController = ScrollController();
  final AudioPlayer _sfxPlayer = AudioPlayer();
  bool _canScrollDown = false;
  bool _isAudioPanelOpen = false;
  late AnimationController _audioPanelController;
  late Animation<double> _audioPanelAnimation;

  AudioService get _audio => widget.audioService;

  @override
  void initState() {
    super.initState();

    final gameAudioContext = AudioContext(
      android: const AudioContextAndroid(
        isSpeakerphoneOn: false,
        stayAwake: false,
        contentType: AndroidContentType.music,
        usageType: AndroidUsageType.game,
        audioFocus: AndroidAudioFocus.none,
      ),
      iOS: AudioContextIOS(
        category: AVAudioSessionCategory.playback,
        options: const {AVAudioSessionOptions.mixWithOthers},
      ),
    );

    AudioPlayer.global.setAudioContext(gameAudioContext);
    _sfxPlayer.setAudioContext(gameAudioContext);

    _fadeController = AnimationController(
      vsync: this,
      duration: kFadeDuration,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _audioPanelController = AnimationController(
      vsync: this,
      duration: kFadeDuration,
    );

    _audioPanelAnimation = CurvedAnimation(
      parent: _audioPanelController,
      curve: Curves.easeInOut,
    );

    _textScrollController.addListener(_updateScrollFade);
    _loadProgress();
  }

  void _updateScrollFade() {
    if (!_textScrollController.hasClients) return;
    final pos = _textScrollController.position;
    final canScroll = pos.pixels < pos.maxScrollExtent - 1.0;
    if (canScroll != _canScrollDown) {
      setState(() => _canScrollDown = canScroll);
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

  void _closeAudioPanel() {
    if (!_isAudioPanelOpen) return;
    _audioPanelController.reverse().then((_) {
      if (mounted) setState(() => _isAudioPanelOpen = false);
    });
  }

  void _toggleUi() {
    setState(() {
      _isUiVisible = !_isUiVisible;

      if (_isUiVisible) {
        _fadeController.forward();
      } else {
        _fadeController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _audioPanelController.dispose();
    _textScrollController.dispose();
    _sfxPlayer.dispose();
    super.dispose();
  }

  Future<void> _playNodeAudio(StoryNode node) async {
    try {
      if (node.sfx != null && _audio.isSfxEnabled) {
        await _sfxPlayer.play(AssetSource('audio/${node.sfx}'));
      }
      if (node.music != null) {
        await _audio.changeMusic(node.music!);
      }
    } catch (e) {
      debugPrint('Error playing audio: $e');
    }
  }

  Future<void> _showUiAfterDelay() async {
    if (_audio.artFocusMode) return;

    await Future.delayed(kUiRevealDelay);
    if (!mounted) return;

    setState(() {
      _isUiVisible = true;
    });
    _fadeController.forward();
  }

  Future<void> _loadProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      if (!mounted) return;
      setState(() {
        _currentIndex = prefs.getInt(kStoryIndexKey) ?? kStartingNodeIndex;
        _currentLang = prefs.getString(kLanguageKey) ?? 'en';
        _isUiVisible = false;
      });
    } catch (e) {
      debugPrint('Error loading progress: $e');
      if (!mounted) return;
      setState(() {
        _currentIndex = kStartingNodeIndex;
        _isUiVisible = false;
      });
    }

    _fadeController.value = 0.0;
    _canScrollDown = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateScrollFade());

    final node = storyNodes[_currentIndex];
    if (node != null) {
      await _playNodeAudio(node);
    }

    await _showUiAfterDelay();
  }

  void _makeChoice(int nextIndex) async {
    _sfxPlayer.stop();
    _fadeController.value = 0.0;
    setState(() {
      _isUiVisible = false;
    });

    await Future.delayed(kTransitionDelay);
    if (!mounted) return;

    setState(() {
      _currentIndex = nextIndex;
    });

    final node = storyNodes[nextIndex];
    if (node != null) {
      await _playNodeAudio(node);
    }

    if (_textScrollController.hasClients) {
      _textScrollController.jumpTo(0.0);
    }
    _canScrollDown = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateScrollFade());

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(kStoryIndexKey, nextIndex);
    } catch (e) {
      debugPrint('Error saving story progress: $e');
    }

    await _showUiAfterDelay();
  }

  Future<void> _returnToMenu() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(kStoryIndexKey, kStartingNodeIndex);
    } catch (e) {
      debugPrint('Error resetting story progress: $e');
    }

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainMenuScreen(audioService: _audio),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final node = storyNodes[_currentIndex];

    if (node == null) {
      return _buildEndScreen();
    }

    final content = node.contentFor(_currentLang);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                if (_isAudioPanelOpen || _isUiVisible) {
                  _closeAudioPanel();
                  if (_isUiVisible) {
                    setState(() {
                      _isUiVisible = false;
                      _fadeController.reverse();
                    });
                  }
                } else {
                  _toggleUi();
                }
              },
              child: AnimatedSwitcher(
                duration: kFadeDuration,
                child: Image.asset(
                  node.image,
                  key: ValueKey<String>(node.image),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  semanticLabel: 'Story illustration',
                ),
              ),
            ),
          ),

          Positioned(
            top: 40,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
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
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(24),
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
                            ],
                          ),
                        ),
                      ),
                    _circleIconButton(
                      icon: (_audio.isMusicPlaying || _audio.isSfxEnabled)
                          ? Icons.volume_up
                          : Icons.volume_off,
                      tooltip: 'Audio settings',
                      onPressed: _toggleAudioPanel,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _circleIconButton(
                  icon: Icons.home,
                  tooltip: 'Return to menu',
                  onPressed: _returnToMenu,
                ),
              ],
            ),
          ),

          FadeTransition(
            opacity: _fadeAnimation,
            child: IgnorePointer(
              ignoring: !_isUiVisible,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: _toggleUi,
                  child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * kStoryPanelMaxHeightRatio,
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 40.0),
                  decoration: BoxDecoration(
                    color: kPanelBackground,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    border: Border(
                      top: BorderSide(color: Colors.brown.withValues(alpha: 0.2), width: 1.5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 20,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: _canScrollDown
                                  ? const [Colors.black, Colors.black, Colors.transparent]
                                  : const [Colors.black, Colors.black],
                              stops: _canScrollDown
                                  ? const [0.0, 0.8, 1.0]
                                  : const [0.0, 1.0],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn,
                          child: SingleChildScrollView(
                            controller: _textScrollController,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: Text(
                              content.text,
                              style: const TextStyle(
                                fontFamily: 'StoryFont',
                                fontSize: 16,
                                height: 1.6,
                                letterSpacing: 0.3,
                                color: kDarkBrown,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      _buildChoiceButtons(node, content),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }

  Widget _buildEndScreen() {
    return Scaffold(
      backgroundColor: kOldLace,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ui('endOfStory', _currentLang),
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'StoryFont',
                  color: kDarkBrown,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: kDarkBrown,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  elevation: 3,
                ),
                onPressed: _returnToMenu,
                child: Text(
                  ui('returnToMenu', _currentLang),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceButtons(StoryNode node, StoryContent content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _choiceButton(
          label: content.choice1,
          onPressed: () => _makeChoice(node.nextIndex1),
        ),
        if (content.hasSecondChoice) ...[
          const SizedBox(height: 16),
          _choiceButton(
            label: content.choice2!,
            onPressed: () => _makeChoice(node.nextIndex2!),
          ),
        ],
      ],
    );
  }

  Widget _choiceButton({required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: kDarkBrown,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        elevation: 2,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, height: 1.4, letterSpacing: 0.5),
        textAlign: TextAlign.center,
      ),
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
        color: isEnabled ? Colors.white : Colors.white38,
      ),
      onPressed: onPressed,
    );
  }

  Widget _circleIconButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black45,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        tooltip: tooltip,
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
