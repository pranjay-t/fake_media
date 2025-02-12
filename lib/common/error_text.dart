import 'package:flutter/material.dart';

/* 
  A reusable widget for displaying error messages.
  This widget centers the provided error text on the screen with a custom font and size.
*/
class ErrorText extends StatelessWidget {
  // The error message to be displayed.
  final String error;
  const ErrorText({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          error,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}