import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import '../constants.dart';
import '../models/story_node.dart';
import '../services/audio_service.dart';
import '../story_data.dart';
import 'menu_screen.dart';

class StoryScreen extends StatefulWidget {
  final AudioService audioService;

  const StoryScreen({super.key, required this.audioService});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> with SingleTickerProviderStateMixin {
  bool _isUiVisible = true;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  int _currentIndex = 0;
  String _currentLang = 'en';
  final ScrollController _textScrollController = ScrollController();
  final AudioPlayer _sfxPlayer = AudioPlayer();

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

    _loadProgress();
  }

  void _toggleMusic() {
    _audio.toggleMusic();
    setState(() {});
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
    _textScrollController.dispose();
    _sfxPlayer.dispose();
    super.dispose();
  }

  Future<void> _playNodeAudio(StoryNode node) async {
    try {
      if (node.sfx != null) {
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

    final node = storyNodes[_currentIndex];
    if (node != null) {
      await _playNodeAudio(node);
    }

    await _showUiAfterDelay();
  }

  void _makeChoice(int nextIndex) async {
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
                if (!_isUiVisible) _toggleUi();
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
              children: [
                _circleIconButton(
                  icon: _audio.isMusicPlaying ? Icons.volume_up : Icons.volume_off,
                  tooltip: _audio.isMusicPlaying ? 'Mute music' : 'Unmute music',
                  onPressed: _toggleMusic,
                ),
                const SizedBox(height: 10),
                _circleIconButton(
                  icon: _isUiVisible ? Icons.visibility : Icons.visibility_off,
                  tooltip: _isUiVisible ? 'Hide story text' : 'Show story text',
                  onPressed: _toggleUi,
                ),
                const SizedBox(height: 10),
                _circleIconButton(
                  icon: Icons.exit_to_app,
                  tooltip: 'Exit app',
                  onPressed: () => SystemNavigator.pop(),
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
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.black, Colors.transparent],
                              stops: [0.0, 0.8, 1.0],
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
                _currentLang == 'en'
                    ? "You have reached the end of the story.\n\nThank you for playing!\n\nYou can start the story again and choose different paths."
                    : "Dosáhli jste konce příběhu.\n\nDěkujeme za hraní!\n\nMůžete příběh začít znovu a zvolit si jiné cesty.",
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
                  _currentLang == 'en' ? "Return to Main Menu" : "Zpět do hlavního menu",
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
