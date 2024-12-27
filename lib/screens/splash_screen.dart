import 'package:ferrari/auth/auth.dart';
// import 'package:ferrari/auth/login_or_register.dart';
// import 'package:ferrari/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // For Timer


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Set up the animation
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 30));
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();

    // Navigate to the HomeScreen after 3 seconds
    Timer(Duration(seconds: 30), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Auth()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Ferrari Logo
                  Image.asset(
                    'assets/images/logo.jpg', // Replace with your image path
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 20),
                  // Loading Indicator
                  CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
          // Bottom Text
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Welcome to Ferrari',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
