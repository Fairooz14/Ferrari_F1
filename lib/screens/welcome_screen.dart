// import 'package:ferrari/screens/home_screen.dart';
import 'package:ferrari/screens/lobby_screen.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import 'package:video_player/video_player.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video player
    _controller = VideoPlayerController.asset(
      'assets/images/car_collection/opening.mp4',
    ) // Add your video in assets
      ..setLooping(true) // Loop the video
      ..setVolume(0.0) // Mute the video
      ..initialize().then((_) {
        setState(() {
          _controller.play(); // Auto-play the video
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Video
          Positioned.fill(
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : Center(child: CircularProgressIndicator()),
          ),
          // Overlay Content
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
              child: Column(
                children: [
                  // Ferrari Logo
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Image.asset(
                      'assets/images/logo_transparent.png', // Replace with your Ferrari logo
                      height: 80,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Main Text
                  Text(
                    'Ferrari',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  // Subtitle
                  Text(
                    'This App is for  \nnew F1 fans of Ferrari',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 300),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 140, 6, 6),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        
                        context,
                        Transition(child: LobbyScreen(), transitionEffect: TransitionEffect.FADE)
                      );
                    },
                    child: Text(
                      'START',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  // Subtitle
                  Text(
                    'This App is developed by \nFairooz Nahiyan',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
