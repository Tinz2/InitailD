import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

//Class stateful เรียกใช้การท างานแบบโต้ตอบ (เรียกใช้ State)
class showmusic extends StatefulWidget {
  final String urlvdo;
  showmusic({Key? key, required this.urlvdo}) : super(key: key);
  @override
  State<showmusic> createState() => _MyHomePageState();
}

//class state เขียน Code ภาษา dart เพอื่ รับค่าจากหนา้จอมาคา นวณและส่งคา่่กลบัไปแสดงผล
class _MyHomePageState extends State<showmusic> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  void initState() {
    super.initState();
// Create and store the VideoPlayerController. The VideoPlayerController
// offers several different constructors to play videos from assets, files,
// or the internet.
    _controller = VideoPlayerController.asset((widget.urlvdo));

    _initializeVideoPlayerFuture = _controller.initialize();
  }

//หมายเหตุ ถ้าใน code มีฟังก์ชัน dispose แล้วให้เติมเฉพาะ code เพื่อกา จดัค่าเก่าทเี่ ก็บไว้
  @override
  void dispose() {
// Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  void _intialstate() {
    setState(() {});
  }

  @override
//ส่วนออกแบบหน้าจอ
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(183, 255, 0, 0),
      ),
      body: Center(
//ส่วนออกแบบหน้าจอ
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
// If the VideoPlayerController has finished initialization, use
// the data it provides to limit the aspect ratio of the video.
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
// Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              );
            } else {
// If the VideoPlayerController is still initializing, show a
// loading spinner.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
// Wrap the play or pause in a call to `setState`. This ensures the
// correct icon is shown.
          setState(() {
// If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
// If the video is paused, play it.
              _controller.play();
            }
          });
        },
// Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
