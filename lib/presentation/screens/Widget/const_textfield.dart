import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';

class ConstTextField extends StatelessWidget {
  ConstTextField(
      {Key? key,
      required this.onChanged,
      required this.hintText,
      this.validator,
      required this.controller,
      required this.obscureText,
      this.suffixIcon})
      : super(key: key);
  final Function(String) onChanged;
  final TextEditingController controller;
  final String hintText;
  bool obscureText = false;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
          filled: true,
          fillColor: KColor.previousColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.all(16),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xffB4B0B4))),
    );
  }
}
