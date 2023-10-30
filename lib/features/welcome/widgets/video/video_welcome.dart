import 'package:flutter/material.dart';
import 'package:limboscan/utils/system/system_utils.dart';
import 'package:limboscan/utils/theme/theme_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller =
          VideoPlayerController.asset('assets/ilustrations/welcomevideo.mp4')
            ..initialize().then((_) {
              _controller?.setVolume(0);
              _controller?.setLooping(true);
              _controller?.play();
              setState(() {});
            });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isTablet(context)) {
      return Container(
        margin: EdgeInsets.only(top: 15.h),
        child: Image.asset(
          'assets/logos/appstore.png',
          height: 22.h,
        ),
      );
    }

    return SizedBox(
        child: _controller?.value.isInitialized == true
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
            : Container(
                width: 100.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: colorSdy(context),
                ),
              ));
  }
}
