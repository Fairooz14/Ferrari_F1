import 'package:ferrari/componets/my_button.dart';
import 'package:ferrari/componets/my_textfield.dart';
import 'package:ferrari/helper/helper_functions.dart';
// import 'package:ferrari/screens/lobby_screen.dart';
import 'package:ferrari/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;

  LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  // Login method
  void login() async{
    // Show a loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Try to sign in the user
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
      if(context.mounted) Navigator.pop(context);
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LobbyScreen()));
    } on FirebaseAuthException catch (e) {
      // Pop loading circle
      Navigator.pop(context);

      // Show error message to user
      displayMessageToUser(e.code, context);
    }
    // If successful, navigate to the lobby screen
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ferrari Logo
              Image.asset(
                'assets/images/logo.jpg', // Replace with your image path
                height: 150,
                width: 150,
              ),
              SizedBox(height: 20),
              // Email TextField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyTextfield(
                  hintText: "Email", 
                  obscureText: false, 
                  controller: emailcontroller,
                  )
              ),
              SizedBox(height: 20),
              // Password TextField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyTextfield(
                  hintText: "Password", 
                  obscureText: true, 
                  controller: passwordcontroller,
                  
                  ),
              ),
              // Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Forget Password?", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
          
              SizedBox(height: 20),
              // Login Button
              MyButton(
                text: "Login", 
                onTap: login,
                ),
              SizedBox(height: 20),

              // Register 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(color: const Color.fromARGB(255, 177, 177, 177), fontSize: 16)),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text("Register Here!", 
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 16, 
                      fontWeight: FontWeight.bold
                      ),
                      )),
                ],
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}