import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  }); // Added semicolon here

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 180*2,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 140, 6, 6), // Example decoration
        ), // Added closing bracket here
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              ),
          ),
        ),
      ),
    );
  }
}