import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart'; 
import 'story_data.dart';

final AudioPlayer globalAudioPlayer = AudioPlayer();
bool globalIsMusicPlaying = true;
String currentMusicTrack = ''; 
bool globalArtFocusMode = false; 

// A universal function to seamlessly swap music tracks
Future<void> changeGlobalMusic(String trackName) async {
  if (currentMusicTrack == trackName) return;

  currentMusicTrack = trackName;
  try {
    await globalAudioPlayer.stop();
    await globalAudioPlayer.setReleaseMode(ReleaseMode.loop);

    if (globalIsMusicPlaying) {
      await globalAudioPlayer.play(AssetSource('audio/$trackName'));
    }
  } catch (e) {
    debugPrint('Error changing music to $trackName: $e');
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const VisualNovelApp());
}

class VisualNovelApp extends StatelessWidget {
  const VisualNovelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relaxing Story',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDF5E6),
        fontFamily: 'StoryFont', 
      ),
      home: const MainMenuScreen(),
    );
  }
}

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  bool _hasSavedGame = false;
  String _currentLang = 'en';
  bool _isSettingsMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _checkSavedProgress();
    
    // Using our new robust audio function for the menu music!
    changeGlobalMusic('bg_music_day_1.mp3');
  }

  void _toggleLanguage() async {
    setState(() {
      _currentLang = (_currentLang == 'en') ? 'cs' : 'en';
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', _currentLang);
    } catch (e) {
      debugPrint('Error saving language preference: $e');
    }
  }

  void _toggleMusic() {
    try {
      if (globalIsMusicPlaying) {
        globalAudioPlayer.pause();
      } else {
        globalAudioPlayer.resume();
      }
    } catch (e) {
      debugPrint('Error toggling music: $e');
    }

    setState(() {
      globalIsMusicPlaying = !globalIsMusicPlaying;
    });
  }

  Future<void> _checkSavedProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedIndex = prefs.getInt('storyIndex') ?? 100;

      if (!mounted) return;
      setState(() {
        _currentLang = prefs.getString('language') ?? 'en';
        globalArtFocusMode = prefs.getBool('artFocusMode') ?? false;
        if (savedIndex > 100) {
          _hasSavedGame = true;
        }
      });
    } catch (e) {
      debugPrint('Error loading saved progress: $e');
    }
  }

  void _toggleArtMode() async {
    setState(() {
      globalArtFocusMode = !globalArtFocusMode;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('artFocusMode', globalArtFocusMode);
    } catch (e) {
      debugPrint('Error saving art mode preference: $e');
    }
  }

  Future<void> _startGame({required bool isNewGame}) async {
    try {
      if (isNewGame) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('storyIndex', 100);
      }
    } catch (e) {
      debugPrint('Error saving new game state: $e');
    }

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const StoryScreen()),
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
            ),
          ),
          
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.3)),
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
                icon: Icon(
                  globalIsMusicPlaying ? Icons.volume_up : Icons.volume_off,
                  color: Colors.white,
                ),
                onPressed: _toggleMusic,
              ),
            ),
          ),

          // Menu Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Your Game Title stays at the top of both menus!
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

                // --- CHECK WHICH MENU TO SHOW ---
                if (!_isSettingsMenuOpen) ...[
                  // ==========================================
                  //                 MAIN MENU
                  // ==========================================
                  if (_hasSavedGame) ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.9),
                        foregroundColor: const Color(0xFF3E2723),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      onPressed: () => _startGame(isNewGame: false),
                      child: Text(_currentLang == 'en' ? "Continue" : "Pokračovat", style: const TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(height: 20),
                  ],

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      foregroundColor: const Color(0xFF3E2723),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () => _startGame(isNewGame: true),
                    child: Text(_currentLang == 'en' ? "New Game" : "Nová hra", style: const TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 20),
                  
                  // --- THE NEW SETTINGS BUTTON ---
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      foregroundColor: const Color(0xFF3E2723),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {
                      setState(() {
                        _isSettingsMenuOpen = true; // Opens the sub-menu!
                      });
                    },
                    child: Text(_currentLang == 'en' ? "Settings" : "Nastavení", style: const TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      foregroundColor: const Color(0xFF3E2723),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {
                      SystemNavigator.pop(); 
                    },
                    child: Text(_currentLang == 'en' ? "Exit Game" : "Ukončit hru", style: const TextStyle(fontSize: 20)),
                  ),

                ] else ...[
                  // ==========================================
                  //                SETTINGS MENU
                  // ==========================================
                  // --- THE NEW LANGUAGE BUTTON ---
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      foregroundColor: const Color(0xFF3E2723),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: _toggleLanguage,
                    child: Text(
                      _currentLang == 'en' ? "Language: English" : "Jazyk: Čeština", 
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      foregroundColor: const Color(0xFF3E2723),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: _toggleArtMode,
                    child: Text(
                      _currentLang == 'en' 
                          ? (globalArtFocusMode ? "Mode: Art Focus" : "Mode: Story Focus")
                          : (globalArtFocusMode ? "Režim: Obraz" : "Režim: Příběh"),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- THE BACK BUTTON ---
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      foregroundColor: const Color(0xFF3E2723),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {
                      setState(() {
                        _isSettingsMenuOpen = false; // Closes the sub-menu!
                      });
                    },
                    child: Text(_currentLang == 'en' ? "Back" : "Zpět", style: const TextStyle(fontSize: 20)),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> with SingleTickerProviderStateMixin {
  bool _isUiVisible = true;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  int currentIndex = 0;
  String _currentLang = 'en'; 
  final ScrollController _textScrollController = ScrollController();
  final AudioPlayer _sfxPlayer = AudioPlayer();
  
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
      duration: const Duration(seconds: 1),
    );
    
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _loadProgress();
  }

  void _toggleMusic() {
    try {
      if (globalIsMusicPlaying) {
        globalAudioPlayer.pause();
      } else {
        globalAudioPlayer.resume();
      }
    } catch (e) {
      debugPrint('Error toggling music: $e');
    }

    setState(() {
      globalIsMusicPlaying = !globalIsMusicPlaying;
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
    _textScrollController.dispose();
    _sfxPlayer.dispose();
    super.dispose();
  }

  Future<void> _loadProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      if (!mounted) return;
      setState(() {
        currentIndex = prefs.getInt('storyIndex') ?? 100;
        _currentLang = prefs.getString('language') ?? 'en';
        _isUiVisible = false;
      });
    } catch (e) {
      debugPrint('Error loading progress: $e');
      if (!mounted) return;
      setState(() {
        currentIndex = 100;
        _isUiVisible = false;
      });
    }

    _fadeController.value = 0.0;

    final startingNode = storyData[currentIndex];

    if (startingNode != null) {
      final Map<String, dynamic> safeNode = startingNode;

      try {
        if (safeNode.containsKey("sfx")) {
          await _sfxPlayer.play(AssetSource('audio/${safeNode["sfx"]}'));
        }
        if (safeNode.containsKey("music")) {
          await changeGlobalMusic(safeNode["music"]);
        }
      } catch (e) {
        debugPrint('Error playing audio on load: $e');
      }
    }

    if (!globalArtFocusMode) {
      await Future.delayed(const Duration(milliseconds: 1500));
      if (!mounted) return;

      setState(() {
        _isUiVisible = true;
      });
      _fadeController.forward();
    }
  }

  void _makeChoice(int nextIndex) async {
    _fadeController.value = 0.0;
    setState(() {
      _isUiVisible = false;
    });

    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    setState(() {
      currentIndex = nextIndex;
    });

    final nextNode = storyData[nextIndex];

    if (nextNode != null) {
      final Map<String, dynamic> safeNode = nextNode;

      try {
        if (safeNode.containsKey("sfx")) {
          await _sfxPlayer.play(AssetSource('audio/${safeNode["sfx"]}'));
        }
        if (safeNode.containsKey("music")) {
          await changeGlobalMusic(safeNode["music"]);
        }
      } catch (e) {
        debugPrint('Error playing audio on choice: $e');
      }
    }

    if (_textScrollController.hasClients) {
      _textScrollController.jumpTo(0.0);
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('storyIndex', nextIndex);
    } catch (e) {
      debugPrint('Error saving story progress: $e');
    }

    if (!globalArtFocusMode) {
      await Future.delayed(const Duration(milliseconds: 1500));
      if (!mounted) return;

      setState(() {
        _isUiVisible = true;
      });
      _fadeController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentStory = storyData[currentIndex];

    if (currentStory == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFFDF5E6), 
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
                    color: Color(0xFF3E2723), // Matching your dark brown text
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF3E2723),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    elevation: 3,
                  ),
                  onPressed: () async {
                    // Reset saved progress upon exiting to the main menu
                    try {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setInt('storyIndex', 100);
                    } catch (e) {
                      debugPrint('Error resetting story progress: $e');
                    }

                    if (!mounted) return;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainMenuScreen()),
                    );
                  },
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
    
    // activeTextData only holds the text and choices for the current language!
    final activeTextData = currentStory[_currentLang] ?? currentStory;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                if (!_isUiVisible) {
                  _toggleUi();
                }
              },
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1), 
                // Using currentStory for Universal Data (Image)
                child: Image.asset(
                  currentStory["image"], 
                  key: ValueKey<String>(currentStory["image"]), 
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          
          Positioned(
            top: 40,
            right: 20,
            child: Column( 
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      globalIsMusicPlaying ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                    ),
                    onPressed: _toggleMusic,
                  ),
                ),
                const SizedBox(height: 10), 
                
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      _isUiVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: _toggleUi,
                  ),
                ),
                const SizedBox(height: 10), 
                
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.exit_to_app, color: Colors.white), 
                    onPressed: () {
                      SystemNavigator.pop(); 
                    },
                  ),
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
                    maxHeight: MediaQuery.of(context).size.height * 0.75,
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 40.0),
                  decoration: BoxDecoration(
                    color: const Color(0xEEFDF5E6), 
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    border: Border(
                      top: BorderSide(color: Colors.brown.withOpacity(0.2), width: 1.5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
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
                              colors: [
                                Colors.black, 
                                Colors.black, 
                                Colors.transparent, 
                              ],
                              stops: [0.0, 0.8, 1.0], 
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn, 
                          child: SingleChildScrollView(
                            controller: _textScrollController,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(bottom: 40.0), 
                            // Using activeTextData for Localized Data (Text)
                            child: Text(
                              activeTextData["text"],
                              style: const TextStyle(
                                fontFamily: 'StoryFont', 
                                fontSize: 16, 
                                height: 1.6, 
                                letterSpacing: 0.3, 
                                color: Color(0xFF3E2723), 
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 35),
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch, 
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF3E2723),
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              elevation: 2,
                            ),
                            onPressed: () => _makeChoice(currentStory["nextIndex1"]),
                            child: Text(
                              activeTextData["choice1"],
                              style: const TextStyle(fontSize: 16, height: 1.4, letterSpacing: 0.5),
                              textAlign: TextAlign.center, 
                            ),
                          ),
                          
                          if (activeTextData.containsKey("choice2")) ...[
                            const SizedBox(height: 16), 
                            
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF3E2723),
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                                elevation: 2,
                              ),
                              onPressed: () => _makeChoice(currentStory["nextIndex2"]),
                              child: Text(
                                activeTextData["choice2"],
                                style: const TextStyle(fontSize: 16, height: 1.4, letterSpacing: 0.5),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ],
                      ),
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
}