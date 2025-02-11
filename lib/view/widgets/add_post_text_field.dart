import 'package:flutter/material.dart';

class AddPostTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const AddPostTextField(
      {super.key, required this.controller, required this.label});

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
