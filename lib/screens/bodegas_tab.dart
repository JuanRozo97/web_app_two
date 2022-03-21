import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BodegasTab extends StatefulWidget {
  const BodegasTab({Key? key}) : super(key: key);

  @override
  State<BodegasTab> createState() => _BodegasTabState();
}

class _BodegasTabState extends State<BodegasTab> {
  VideoPlayerController? controller;
  String dataSource =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4";
  String asset = "assets/images/my_video.mp4";

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(asset)
      ..initialize().then((_) {
        setState(() {});
      });

    controller!.play();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 42, top: 42, right: 42, bottom: 16),
        child: ListView(
          children: [
            controller!.value.isInitialized
                ? Container(
                    height: MediaQuery.of(context).size.aspectRatio * 200,
                    width: MediaQuery.of(context).size.aspectRatio * 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(42),
                    ),
                    child: AspectRatio(
                      aspectRatio: controller!.value.aspectRatio,
                      child: VideoPlayer(controller!),
                    ),
                  )
                : SizedBox(
                    height: 10,
                    width: 10,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (controller!.value.isPlaying) {
              controller!.pause();
            } else {
              controller!.play();
            }
          });
        },
        child:
            Icon(controller!.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
