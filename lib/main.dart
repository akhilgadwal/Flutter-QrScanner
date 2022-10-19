import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          duration: 1500,
          splash: Icon(
            Icons.qr_code_rounded,
            color: Colors.white,
            size: 100,
          ),
          splashIconSize: 100,
          nextScreen: Homepage(),
          splashTransition: SplashTransition.fadeTransition,
          //pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors.deepPurple),
    );
  }
}
