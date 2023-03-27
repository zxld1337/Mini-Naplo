import 'package:flutter/material.dart';
import '../../utils/const_varibles.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      body: const SafeArea(
        child: Center(
          child: Text(
            "Unlucky valami hiba van );",
            style: TextStyle(
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: constFontFamily,
            ),
          ),
        ),
      ),
    );
  }
}