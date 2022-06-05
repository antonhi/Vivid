import 'package:flutter/material.dart';
import 'package:projectvivid/components/buttons/button_icon_component.dart';
import 'package:projectvivid/components/text/text_medium_bolded_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';
import 'package:video_player/video_player.dart';

import '../../models/post_model.dart';

class PostVideo extends StatefulWidget {

  final PostModel post;
  final double width;
  final bool isInView;

  const PostVideo({Key? key, required this.post, required this.width, required this.isInView}) : super(key: key);

  @override
  State<PostVideo> createState() => _PostVideoState();
}

class _PostVideoState extends State<PostVideo> {

  late VideoPlayerController controller;
  bool isPlaying = false;
  bool pause = false;
  bool muted = false;
  double position = 0;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('videos/example.mp4');
    controller.initialize().then((value) {
      setState(() {});
      controller.setLooping(true);
      controller.addListener(updatePosition);
      if (widget.isInView) {
        startVideo();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    playback();
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: controller.value.isInitialized ?
        Stack(children: [
          Positioned(child: AspectRatio(aspectRatio: controller.value.aspectRatio, child: GestureDetector(child: VideoPlayer(controller), onTap: () {
            setState(() {
              pause = !pause;
            });
          },))),
          Positioned(child: AnimatedSwitcher(duration: const Duration(seconds: 1),
              child: isPlaying ? const SizedBox(height: 0,) : GestureDetector(child: Container(width: widget.width, height: widget.width/(1920/1080),
                decoration: BoxDecoration(color: AppColorConfiguration.dark.withOpacity(0.4)),),
                  onTap: () {
                    setState(() {
                      pause = !pause;
                    });
                  }))),
          Positioned(left: 10, top: 10, right: 10, child: AnimatedSwitcher(duration: const Duration(milliseconds: 500), child: isPlaying ? const SizedBox(height: 0,) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextMediumBoldedComponent(textColor: AppColorConfiguration.white, text: 'Testing'),
            ButtonIconComponent(buttonColor: AppColorConfiguration.transparent,
                icon: Icon(Icons.volume_up), height: 30, onTap: () => toggleVolume())
          ],
          ))),
          Positioned(left: 10, right: 10, bottom: 10,
              child: AnimatedSwitcher(duration: const Duration(milliseconds: 500),
                  child: isPlaying ? const SizedBox(height: 0,) : Slider(
                    value: position,
                    onChanged: setPosition,
                    min: 0,
                    max: (controller.value.isInitialized ? controller.value.duration.inSeconds*1.0 : 0),
                    activeColor: Colors.white,)))
        ],) :
        Container(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void playback() {
    if (widget.isInView && controller.value.isInitialized && !pause) {
      startVideo();
    } else {
      pauseVideo();
    }
  }

  void startVideo() {
    if (mounted) {
      setState(() {
        isPlaying = true;
      });
      controller.play();
    }
  }

  void pauseVideo() {
    controller.pause();
    if (mounted) {
      setState(() {
        isPlaying = false;
      });
    }
  }

  void updatePosition() async {
    var position = await controller.position;
    if (mounted) {
      setState(() {
        this.position = position == null ? 0 : position.inSeconds.toDouble();
      });
    }
  }

  void setPosition(double seconds) async {
    controller.seekTo(Duration(seconds: seconds.truncate()));
    if (mounted) {
      setState(() {
        position = seconds;
      });
    }
  }

  void toggleVolume() {
    if (controller.value.isInitialized) {
      controller.setVolume(controller.value.volume == 0 ? 1 : 0);
      if (mounted) {
        setState(() {
          muted = controller.value.volume == 0;
        });
      }
    }
  }

}