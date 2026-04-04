import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'services/audio_service.dart';
import 'screens/menu_screen.dart';

final audioService = AudioService();

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
      home: MainMenuScreen(audioService: audioService),
    );
  }
}
