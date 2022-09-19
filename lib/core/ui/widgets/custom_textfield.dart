import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? text)? validator;
  final bool required;
  final double borderRadius;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.hint,
    this.initialValue,
    this.keyboardType,
    this.controller,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.validator,
    this.required = false,
    this.borderRadius = 50,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).colorScheme.secondary,
      inputFormatters: inputFormatters,
      controller: controller,
      textAlign: textAlign,
      obscureText: obscureText,
      style: Theme.of(context).textTheme.bodyText1,
      initialValue: initialValue,
      keyboardType: keyboardType,
      validator: validator ??
          (value) {
            if (required && (value == null || value == '')) {
              return 'Required to fill in';
            }
            return null;
          },
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        hintText: hint,
        errorStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Colors.red,
            ),
      ),
    );
  }
}
