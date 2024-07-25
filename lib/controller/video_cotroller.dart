import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({required this.videoPath, Key? key})
      : super(key: key);

  @override
  VideoPlayerWidgetState createState() => VideoPlayerWidgetState();
}

class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  Timer? _timer;
  final FlutterFFmpeg _flutterFFmpeg = FlutterFFmpeg();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _startScreenshotTimer();
      });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startScreenshotTimer() {
    _timer = Timer.periodic( const Duration(seconds: 10), (timer) {
      _takeScreenshot();
    });
  }

  Future<void> _takeScreenshot() async {
    if (_controller.value.isInitialized) {
      final Directory directory = await getTemporaryDirectory();
      final String imagePath = path.join(
          directory.path, '${DateTime.now().millisecondsSinceEpoch}.png');
      final String videoPath = widget.videoPath;
      final int position = _controller.value.position.inMilliseconds;

      final List<String> arguments = [
        '-i',
        videoPath,
        '-ss',
        '${position / 1000}',
        '-vframes',
        '1',
        imagePath
      ];

      final int result = await _flutterFFmpeg.executeWithArguments(arguments);
      if (result == 0) {
        await _sendScreenshot(File(imagePath));
      } else {
        print('Failed to take screenshot');
      }
    }
  }

  Future<void> _sendScreenshot(File imageFile) async {
    final url = Uri.parse('https://httpbin.org/post');
    final request = http.MultipartRequest('POST', url)
      ..files
          .add(await http.MultipartFile.fromPath('screenshot', imageFile.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      print('Screenshot sent successfully');
      final responseData = await http.Response.fromStream(response);
      print('Response data: ${responseData.body}');
    } else {
      print('Failed to send screenshot');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
