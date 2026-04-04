import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer musicPlayer = AudioPlayer();
  bool isMusicPlaying = true;
  bool isSfxEnabled = true;
  bool isPageSfxEnabled = true;
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
      } else if (_currentTrack.isNotEmpty) {
        // If a track was set but never played, start it; otherwise resume
        musicPlayer.resume().catchError((_) {
          musicPlayer.setReleaseMode(ReleaseMode.loop);
          musicPlayer.play(AssetSource('audio/$_currentTrack'));
        });
      }
    } catch (e) {
      debugPrint('Error toggling music: $e');
    }
    isMusicPlaying = !isMusicPlaying;
  }

  void dispose() {
    musicPlayer.dispose();
  }
}
