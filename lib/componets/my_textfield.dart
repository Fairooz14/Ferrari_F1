import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {

  final String hintText; 
  final bool obscureText;
  final TextEditingController controller;
  

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      //input text color
      style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
      textDirection: TextDirection.ltr,
      controller: controller,
      decoration: InputDecoration( 
        fillColor: Colors.white,
        labelText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        //change color of input text
        hintStyle: TextStyle(color: const Color.fromARGB(255, 156, 156, 156)),
        //input text color
        focusColor: const Color.fromARGB(255, 255, 255, 255),
        // filled: true,

      ),
      obscureText: obscureText,
    
    );
  }
}