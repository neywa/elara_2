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
      await musicPlayer.setSourceAsset('audio/$trackName');

      if (isMusicPlaying) {
        await musicPlayer.resume();
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
        musicPlayer.resume();
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
