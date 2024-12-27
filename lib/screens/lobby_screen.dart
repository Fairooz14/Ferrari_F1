import 'package:ferrari/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

import 'sports_car_screen.dart'; 
// import 'sports_car_screen.dart'; 

class LobbyScreen extends StatefulWidget {
  @override
  _LobbyScreenState createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  int _selectedIndex = 0;

  // List of screens for navigation
  final List<Widget> _screens = [
    HomeScreen(), // Home Screen
    SportsCarScreen(), // Sports Car Screen
  ];

  // Logout user
  void logout() {
    FirebaseAuth.instance.signOut();
    // Add navigation to login screen if needed
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Image(
              image: AssetImage('assets/images/logo.jpg'),
              height: 50,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: logout,
          ),
        ],
      ),
      body: _screens[_selectedIndex], // Display the current screen
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
            svgPath: "assets/images/home.svg",
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            extras: {"label": "Home"},
          ),
          FluidNavBarIcon(
            svgPath: "assets/images/car.svg",
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            extras: {"label": "Sports Cars"},
          ),
        ],
        onChange: (index) {
          setState(() {
            _selectedIndex = index; // Update selected index
          });
        },
        style: FluidNavBarStyle(
          iconSelectedForegroundColor: Colors.transparent,
          iconUnselectedForegroundColor: const Color.fromARGB(255, 255, 255, 255),
          barBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        scaleFactor: 1.5, // Icon size scaling
      ),
    );
  }
}
