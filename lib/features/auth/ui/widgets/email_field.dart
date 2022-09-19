import 'package:auth_example/core/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  EmailField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      validator: (value) {
        if (value == null || !emailRegex.hasMatch(value)) {
          return "Incorrect email";
        }
        return null;
      },
      controller: controller,
      required: true,
      hint: 'Email',
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [
        LengthLimitingTextInputFormatter(40),
      ],
    );
  }
}
