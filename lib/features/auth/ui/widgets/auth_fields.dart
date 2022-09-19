import 'package:auth_example/core/ui/widgets/custom_round_button.dart';
import 'package:auth_example/core/ui/widgets/custom_textfield.dart';
import 'package:auth_example/data/models/auth_data.dart';
import 'package:flutter/material.dart';

import 'email_field.dart';

class AuthFields extends StatelessWidget {
  final String authText;
  final Function(AuthData authData) onSubmit;

  AuthFields({
    Key? key,
    required this.authText,
    required this.onSubmit,
  }) : super(key: key);

  final authData = AuthData();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = authData.emailController;

    final passwordController = authData.passwordController;
    return Form(
      key: _formKey,
      child: Column(children: [
        EmailField(
          controller: emailController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          hint: 'Password',
          required: true,
          obscureText: true,
          controller: passwordController,
        ),
        const SizedBox(height: 20),
        CustomRoundButton(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              onSubmit(authData);
            }
          },
          title: authText,
        ),
      ]),
    );
  }
}
