import 'package:ferrari/componets/my_button.dart';
import 'package:ferrari/componets/my_textfield.dart';
import 'package:ferrari/helper/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onTap;

  RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernamecontroller = TextEditingController();

  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController confirmpwcontroller = TextEditingController();

  // register  method
  void registerUser() async {
    //show a loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    //check if password and confirm password are the same
    if (passwordcontroller.text != confirmpwcontroller.text) {
      //pop  loading circle
      Navigator.pop(context);

      // show error message to user
      displayMessageToUser("Passwords do not match", context);
    }else{
      //try create the user
      try {
        UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text,
        );
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //pop loading circle
        Navigator.pop(context);

        //show error message to user
        displayMessageToUser(e.code, context);
      }
    }
    

    //if successful, navigate to the home screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Ferrari Logo
                Image.asset(
                  'assets/images/logo.jpg', // Replace with your image path
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 20),

                // username TextField
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MyTextfield(
                      hintText: "Username",
                      obscureText: false,
                      controller: usernamecontroller,
                    )),

                SizedBox(height: 20),
                // Email TextField
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MyTextfield(
                      hintText: "Email",
                      obscureText: false,
                      controller: emailcontroller,
                    )),

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

                SizedBox(height: 20),

                // Confirm Password TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MyTextfield(
                    hintText: "Re-type Password",
                    obscureText: true,
                    controller: confirmpwcontroller,
                  ),
                ),

                SizedBox(height: 20),
                // Register Button
                MyButton(
                  text: "Register",
                  onTap: registerUser,
                ),
                SizedBox(height: 20),

                // Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 177, 177, 177),
                            fontSize: 16)),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Login Here!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
