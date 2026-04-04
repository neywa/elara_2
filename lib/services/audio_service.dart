import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';
import '../constants.dart';

class AudioService {
  final AudioPlayer musicPlayer = AudioPlayer();
  bool isMusicPlaying = true;
  String _currentTrack = '';
  bool artFocusMode = false;

  Future<void> changeMusic(String trackName) async {
    if (_currentTrack == trackName) return;

    _currentTrack = trackName;
    try {
      // Crossfade: gradually lower volume, switch track, fade back in
      if (isMusicPlaying) {
        final steps = 5;
        final stepDuration = kMusicCrossfadeDuration ~/ steps;
        for (var i = steps; i > 0; i--) {
          await musicPlayer.setVolume(i / steps);
          await Future.delayed(stepDuration);
        }
      }

      await musicPlayer.stop();
      await musicPlayer.setReleaseMode(ReleaseMode.loop);
      await musicPlayer.setVolume(0.0);

      if (isMusicPlaying) {
        await musicPlayer.play(AssetSource('audio/$trackName'));

        // Fade in
        final steps = 5;
        final stepDuration = kMusicCrossfadeDuration ~/ steps;
        for (var i = 1; i <= steps; i++) {
          await Future.delayed(stepDuration);
          await musicPlayer.setVolume(i / steps);
        }
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

  void dispose() {
    musicPlayer.dispose();
  }
}
