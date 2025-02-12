import 'package:flutter/material.dart';

/* 
  A reusable widget that displays a loading indicator.
*/
class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),// Default Flutter loading indicator
    );
  }
}