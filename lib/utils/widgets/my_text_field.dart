import 'package:flutter/material.dart';
import 'package:scraping_job_front/utils/my_colors.dart';

class MyTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  const MyTextField(this.controller, {super.key, this.hintText, this.onChanged, this.prefixIcon, this.suffixIcon, this.fillColor});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: primaryColor,
      onChanged: widget.onChanged,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        hintText: widget.hintText ?? 'Enter text',
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        fillColor: widget.fillColor ?? Colors.white,
      ),
    );
  }
}