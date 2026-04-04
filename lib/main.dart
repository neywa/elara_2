import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'services/audio_service.dart';
import 'screens/menu_screen.dart';

final audioService = AudioService();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const VisualNovelApp());
}

class VisualNovelApp extends StatefulWidget {
  const VisualNovelApp({super.key});

  @override
  State<VisualNovelApp> createState() => _VisualNovelAppState();
}

class _VisualNovelAppState extends State<VisualNovelApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    audioService.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      audioService.musicPlayer.pause();
    } else if (state == AppLifecycleState.resumed && audioService.isMusicPlaying) {
      audioService.musicPlayer.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relaxing Story',
      theme: ThemeData(
        scaffoldBackgroundColor: kOldLace,
        fontFamily: 'StoryFont',
      ),
      home: MainMenuScreen(audioService: audioService),
    );
  }
}
