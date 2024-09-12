import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ev_homes_crm_v7/auth/login_widget.dart';


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

import '../components/videoplayer.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/splashScreen.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: _isVideoInitialized
          ? VideoPlayer(_controller)
          : FittedBox(
        fit: BoxFit.none,
        child: Image.asset('assets/splashScreen.gif'),
      ), // Display a placeholder while loading
      nextScreen: const LoginWidget(),

      backgroundColor: Colors.white,
      duration: 3000, // Adjust duration as needed
      splashIconSize: 400,
    );
  }
}

