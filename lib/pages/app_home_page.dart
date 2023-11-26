import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

import '../constants/constants.dart';
import '../helpers/methods.dart';
import '../widgets/widgets.dart';
import 'wishes_form_page.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  late VideoPlayerController _controllerOne;
  late VideoPlayerController _controllerTwo;
  final player = AudioPlayer();

  @override
  void initState() {
    _controllerOne = VideoPlayerController.asset(
      AssetsConstant.jemputanOneVideo,
    )..initialize().then((_) async {
        await _controllerOne.setVolume(0);
        await _controllerOne.setLooping(true);
        _controllerOne.play();
        setState(() {});
      });

    _controllerTwo = VideoPlayerController.asset(
      AssetsConstant.jemputanTwoVideo,
    )..initialize().then((_) async {
        await _controllerTwo.setVolume(0);
        await _controllerTwo.setLooping(true);
        _controllerTwo.play();
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _controllerOne.dispose();
    _controllerTwo.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.appWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (!_controllerOne.value.isPlaying ||
                !_controllerTwo.value.isPlaying) ...[
              Image.asset(
                AssetsConstant.jemputanOneImage,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                height: Get.height / 1.3,
              ),
              Image.asset(
                AssetsConstant.jemputanTwoImage,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                height: Get.height / 1.3,
              ),
            ] else ...[
              _controllerOne.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controllerOne.value.aspectRatio,
                      child: VideoPlayer(_controllerOne),
                    )
                  : Container(),
              _controllerTwo.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controllerTwo.value.aspectRatio,
                      child: VideoPlayer(_controllerTwo),
                    )
                  : Container(),
            ],
            Container(color: ColorsConstant.appEffectGreen, height: 30.w),
            const WishesCarousel(),
            Container(color: ColorsConstant.appEffectGreen, height: 30.w),
            SizedBox(height: 30.w),
            AppButtonWidget(
              buttonTitle: 'Ucapan',
              buttonIcon: Icons.mail,
              buttonFunction: () {
                Get.to(const WishesFormPage());
              },
            ),
            SizedBox(height: 80.w)
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 10.w),
        child: FloatingActionButton.extended(
          backgroundColor: ColorsConstant.appDarkGreen.withOpacity(.7),
          onPressed: () {
            // play background music
            AudioPlayerHandler().playAudio(player);
          },
          label: Row(
            children: [
              Text(
                CalendarHandler.dayToEvent < 1
                    ? ''
                    : '${CalendarHandler.dayToEvent} Hari lagi  ',
              ),
              const Icon(Icons.volume_up_rounded),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      bottomSheet: const AppButtonNavWidget(),
    );
  }
}
