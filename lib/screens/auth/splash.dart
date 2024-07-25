import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vue_v4/app/cache_helper/cache_helper.dart';
import 'package:vue_v4/screens/home/home.dart';
import 'package:vue_v4/screens/auth/intro.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool showText = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller and the animation
    animationOfLogo();

    // Schedule the text and animation to appear after 5 minutes (300000 milliseconds)
    animationOfText();
    //handel the cach
    bool visited = CacheHelper.getData(key: 'introScreen') ?? false;
    cashHandel(visited);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated logo
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _animation.value),
                      child: child,
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/logo.svg',
                    height: 100, // adjust the size as needed
                  ),
                ),
                const SizedBox(height: 10),
                // Conditional text
                if (showText)
                  const Text(
                    'VU for view',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void cashHandel(bool visited) {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => visited ? const Home() : const IntroSCreen()));
      },
    );
  }

  void animationOfText() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          showText = true;
        });
        _controller.forward();
      },
    );
  }

  void animationOfLogo() {
    // Initialize the animation controller and the animation
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 10, end: -20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }
}
