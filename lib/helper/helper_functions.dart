import 'package:flutter/material.dart';

// dialay error to user
void displayMessageToUser(String message, BuildContext context) {
  // show error message to user
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}