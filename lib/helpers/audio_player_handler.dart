import 'package:just_audio/just_audio.dart';

import '../constants/constants.dart';

class AudioPlayerHandler {
  Future<void> playAudio(AudioPlayer player) async {
    await player.setAsset(AssetsConstant.backgroundMusic);
    if (player.playing) {
      await player.pause();
    } else {
      await player.play();
    }
  }
}
