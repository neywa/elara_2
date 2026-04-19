import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer musicPlayer = AudioPlayer();
  bool isMusicPlaying = true;
  bool isSfxEnabled = true;
  bool isPageSfxEnabled = true;
  String _currentTrack = '';
  bool artFocusMode = false;
  bool _contextConfigured = false;

  static final AudioContext gameAudioContext = AudioContext(
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

  Future<void> setupAudioContext() async {
    if (_contextConfigured) return;
    _contextConfigured = true;
    try {
      await AudioPlayer.global.setAudioContext(gameAudioContext);
      await musicPlayer.setAudioContext(gameAudioContext);
    } catch (e) {
      debugPrint('Error setting audio context: $e');
    }
  }

  Future<void> changeMusic(String trackName) async {
    if (_currentTrack == trackName) return;

    _currentTrack = trackName;
    try {
      await musicPlayer.stop();
      await musicPlayer.setReleaseMode(ReleaseMode.loop);

      if (isMusicPlaying) {
        // play() properly requests audio focus so SFX can't steal it
        await musicPlayer.play(AssetSource('audio/$trackName'));
      } else {
        // Preload source so toggleMusic can start it later via resume()
        await musicPlayer.setSourceAsset('audio/$trackName');
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
