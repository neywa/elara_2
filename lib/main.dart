import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart'; // Adds SystemChrome and SystemNavigator
import 'story_data.dart';

final AudioPlayer globalAudioPlayer = AudioPlayer();
bool globalIsMusicPlaying = true;

void main() {
  // Required when we talk to the system before the app runs
  WidgetsFlutterBinding.ensureInitialized(); 

  // Tells Android to hide the top and bottom system bars
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
        // The soft Old Lace background color
        scaffoldBackgroundColor: const Color(0xFFFDF5E6),
        // Setting a global serif font for a paper/book feel
        fontFamily: 'Serif', 
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

  @override
  void initState() {
    super.initState();
    _checkSavedProgress();
    _startMusic(); // Start the music as soon as the menu loads!
  }

  // Toggles the global music from the Main Menu
  void _toggleMusic() {
    if (globalIsMusicPlaying) {
      globalAudioPlayer.pause();
    } else {
      globalAudioPlayer.resume();
    }
    
    setState(() {
      globalIsMusicPlaying = !globalIsMusicPlaying;
    });
  }

  // The function to loop and play the music
  Future<void> _startMusic() async {
    await globalAudioPlayer.setReleaseMode(ReleaseMode.loop);
    if (globalIsMusicPlaying) {
      await globalAudioPlayer.play(AssetSource('audio/bg_music.mp3'));
    }
  }

  // Check if the player has progressed past the starting node (Node 100)
  Future<void> _checkSavedProgress() async {
    final prefs = await SharedPreferences.getInstance();
    // Assuming 100 is the start of Chapter 1 based on our new structure
    final savedIndex = prefs.getInt('storyIndex') ?? 100; 
    
    if (savedIndex > 100) {
      setState(() {
        _hasSavedGame = true;
      });
    }
  }

  // Handle starting or continuing the game
  Future<void> _startGame({required bool isNewGame}) async {
    if (isNewGame) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('storyIndex', 100); // Wipe progress and start at Chapter 1
    }

      // Navigate to the actual story screen
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
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/title.jpg',
              fit: BoxFit.cover,
            ),
          ),
          
          // Dark overlay to make text pop
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),

          // 3. The Mute Button (Top Right)
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
                // Your Game Title
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

                // Continue Button (Only shows if they have a save!)
                if (_hasSavedGame) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      foregroundColor: const Color(0xFF3E2723),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () => _startGame(isNewGame: false),
                    child: const Text("Continue", style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 20),
                ],

                // New Game Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    foregroundColor: const Color(0xFF3E2723),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: () => _startGame(isNewGame: true),
                  child: const Text("New Game", style: TextStyle(fontSize: 20)),
                ),
                
                const SizedBox(height: 20),
                
                // Exit Game Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    foregroundColor: const Color(0xFF3E2723),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: () {
                    // Tells the operating system to close the app
                    SystemNavigator.pop(); 
                  },
                  child: const Text("Exit Game", style: TextStyle(fontSize: 20)),
                ),
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

  // Our new, absolute-control animation variables
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  // This integer tracks where we are in the story.
  int currentIndex = 0;

  
  

  @override
  void initState() {
    super.initState();
    
    // 1. Set up the absolute 1-second timer
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    
    // 2. Make the fade smooth
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _loadProgress();
  }

  // Updated toggle function using global variables
  void _toggleMusic() {
    if (globalIsMusicPlaying) {
      globalAudioPlayer.pause(); 
    } else {
      globalAudioPlayer.resume(); 
    }
    
    setState(() {
      globalIsMusicPlaying = !globalIsMusicPlaying; 
    });
  }
  
  // Function to softly hide or show the story text
  void _toggleUi() {
    setState(() {
      _isUiVisible = !_isUiVisible; // Flips the true/false tracker
      
      if (_isUiVisible) {
        _fadeController.forward(); // Smoothly fade the text IN
      } else {
        _fadeController.reverse(); // Smoothly fade the text OUT
      }
    });
  }

    // It is good practice to stop the player when the app is completely closed
  @override
  void dispose() {
    // Cleans up the animation controller so it doesn't leak memory
    _fadeController.dispose(); 
    
    // Always call super.dispose at the very end!
    super.dispose();
  }

  // Function to load the saved progress
  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    
    setState(() {
      currentIndex = prefs.getInt('storyIndex') ?? 100;
      _isUiVisible = false; // Tell the app the UI is currently hidden
    });
    
    _fadeController.value = 0.0; // INSTANTLY set opacity to 0

    await Future.delayed(const Duration(seconds: 1));
    
    if (mounted) {
      setState(() {
        _isUiVisible = true; // Tell the app the UI is back
      });
      _fadeController.forward(); // Play the 1-second fade-in!
    }
  }

  // Function to save progress and update the screen
  // Notice the 'async' keyword added here!
  void _makeChoice(int nextIndex) async {
    setState(() {
      _isUiVisible = false; // Tracker: UI is gone
      currentIndex = nextIndex; // Instantly change background
    });
    
    _fadeController.value = 0.0; // INSTANTLY hide the text

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('storyIndex', nextIndex);

    // Let the naked background sit there for 1 second
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      _isUiVisible = true; // Tracker: UI is back
    });
    
    _fadeController.forward(); // Play the 1-second fade-in!
  }

    @override
  Widget build(BuildContext context) {
    // Get the current story node based on the currentIndex
    final currentStory = storyData[currentIndex];

    // If something goes wrong and the index doesn't exist, show an error.
    if (currentStory == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFFDF5E6), // Old Lace background
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "The story has ended (or we got lost!).",
                style: TextStyle(fontSize: 20, fontFamily: 'Serif'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                ),
                // This is the magic part: it forces the app back to node 0 and saves it!
                onPressed: () => _makeChoice(0), 
                child: const Text("Start from the Beginning"),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // 1. The Dynamic Background Image with a smooth fade
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 1), // 1-second fade transition
              child: Image.asset(
                currentStory["image"], // Pulls the image from your storyData!
                key: ValueKey<String>(currentStory["image"]), // Crucial for the animation to work
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          
          // 2. The Control Buttons (Top Right)
          Positioned(
            top: 40,
            right: 20,
            child: Column( // A Column stacks the buttons vertically
              children: [
                // 1. Mute Button
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
                
                // 2. Hide Text Button
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
                const SizedBox(height: 10), // A little gap for the new button
                
                // 3. Exit Game Button
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    // An icon that looks like leaving a door
                    icon: const Icon(Icons.exit_to_app, color: Colors.white), 
                    onPressed: () {
                      // This tells the Android system to gracefully close the app
                      SystemNavigator.pop(); 
                    },
                  ),
                ),
              ],
            ),
          ),
          
          // 3. The Semi-Transparent Text Area at the bottom
          FadeTransition(
            opacity: _fadeAnimation,
            child: IgnorePointer(
              // Prevents clicking the invisible story buttons when UI is hidden
              ignoring: !_isUiVisible, 
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  // Increased padding gives the text plenty of room to breathe
                  padding: const EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 40.0),
                  decoration: BoxDecoration(
                    // Slightly more opaque Old Lace so the text is always readable
                    color: const Color(0xEEFDF5E6), 
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    // Adds a very subtle brown line at the top of the paper
                    border: Border(
                      top: BorderSide(color: Colors.brown.withOpacity(0.2), width: 1.5),
                    ),
                    // Casts a soft shadow upwards to separate the paper from the background
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
                      // --- THE UPGRADED STORY TEXT ---
                      Text(
                        currentStory["text"],
                        style: const TextStyle(
                          fontSize: 16, // Slightly larger for readability
                          height: 1.6, // Book-style line spacing
                          letterSpacing: 0.3, // Subtle breathing room between letters
                          color: Color(0xFF3E2723), // Deep dark brown instead of harsh pure black
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 35),
                      
                      // --- THE BUTTONS (Stacked vertically for long text) ---
                      Column(
                        // This makes the buttons stretch across the whole text box!
                        crossAxisAlignment: CrossAxisAlignment.stretch, 
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF3E2723),
                              // Added a bit more vertical padding so multi-line text fits nicely
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              elevation: 2,
                            ),
                            onPressed: () => _makeChoice(currentStory["nextIndex1"]),
                            child: Text(
                              currentStory["choice1"],
                              style: const TextStyle(fontSize: 16, height: 1.4, letterSpacing: 0.5),
                              textAlign: TextAlign.center, // Centers the text inside the wide button
                            ),
                          ),
                          
                          // If there is a second choice, draw a spacer and the second button
                          if (currentStory.containsKey("choice2")) ...[
                            const SizedBox(height: 16), // The gap between the two stacked buttons
                            
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF3E2723),
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                                elevation: 2,
                              ),
                              onPressed: () => _makeChoice(currentStory["nextIndex2"]),
                              child: Text(
                                currentStory["choice2"],
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