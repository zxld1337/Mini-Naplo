// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Color cursorColor;
  final Color fontColor;
  final String fontFamily;
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.cursorColor,
    required this.fontColor,
    required this.fontFamily,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: cursorColor,
      style: TextStyle(color: fontColor, fontFamily: fontFamily),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12, color: fontColor.withOpacity(0.2)),
        labelText: labelText,
        labelStyle: TextStyle(color: fontColor.withOpacity(0.6)),
        filled: true,
        fillColor: fontColor.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: fontColor.withOpacity(0.4),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: fontColor),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: fontColor.withOpacity(0.6),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}

/*
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 145, 66, 79)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
*/
