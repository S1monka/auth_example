import 'package:flutter/material.dart';

class AuthData {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Map<String, dynamic> toJson() {
    return {
      'email': emailController.text,
      'password': passwordController.text,
      'returnSecureToken': true,
    };
  }
}
