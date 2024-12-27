import 'package:ferrari/screens/login_screen.dart';
import 'package:ferrari/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

// Initiallyshow login screen
  bool showLoginScreen = true;

  void toggleScreen() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

//Toggle between login and register screen

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(onTap: toggleScreen);
    } else {
      return RegisterScreen(onTap: toggleScreen);
    }
  }
}