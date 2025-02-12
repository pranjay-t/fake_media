import 'package:flutter/material.dart';

/*
 A custom text field widget for adding posts. 
 This widget provides a styled 'TextField' with a border and label.
 It requires a `TextEditingController` and a label text as parameters.
*/
class AddPostTextField extends StatelessWidget {
  // Controller for managing the text input.
  final TextEditingController controller;

  // Label text to display inside the text field.
  final String label;

  // Creates an 'AddPostTextField' widget.
  const AddPostTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      ),
    );
  }
}
