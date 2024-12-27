import 'package:ferrari/auth/login_or_register.dart';
// import 'package:ferrari/screens/lobby_screen.dart';
import 'package:ferrari/screens/welcome_screen.dart';
// import 'package:ferrari/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          // user is logged In
          if(snapshot.hasData){
            return WelcomeScreen();

          }
          // user is not logged in
          else{
            return LoginOrRegister();
          }
        }
        )
    );
  }
}