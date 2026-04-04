import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer musicPlayer = AudioPlayer();
  bool isMusicPlaying = true;
  String _currentTrack = '';
  bool artFocusMode = false;

  Future<void> changeMusic(String trackName) async {
    if (_currentTrack == trackName) return;

    _currentTrack = trackName;
    try {
      await musicPlayer.stop();
      await musicPlayer.setReleaseMode(ReleaseMode.loop);

      if (isMusicPlaying) {
        await musicPlayer.play(AssetSource('audio/$trackName'));
      }
    } catch (e) {
      debugPrint('Error changing music to $trackName: $e');
    }
  }

  void toggleMusic() {
    try {
      if (isMusicPlaying) {
        musicPlayer.pause();
      } else {
        musicPlayer.resume();
      }
    } catch (e) {
      debugPrint('Error toggling music: $e');
    }
    isMusicPlaying = !isMusicPlaying;
  }

  Future<void> loadPreferences(bool artMode) async {
    artFocusMode = artMode;
  }

  void dispose() {
    musicPlayer.dispose();
  }
}
