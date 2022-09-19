import 'package:auth_example/features/auth/bloc/auth_bloc.dart';
import 'package:auth_example/features/auth/ui/widgets/auth_fields.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthType { login, register }

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthType authType = AuthType.login;

  bool get isSignIn => authType == AuthType.login;

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();

    final authText = isSignIn ? "Login" : "Sign Up";

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          authText,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          AuthFields(
                            authText: authText,
                            onSubmit: (authData) {
                              if (isSignIn) {
                                authBloc.add(
                                  AuthLoginPressed(authData: authData),
                                );
                              } else {
                                authBloc.add(
                                  AuthRegisterPressed(authData: authData),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                authType = isSignIn
                                    ? AuthType.register
                                    : AuthType.login;
                              });
                            },
                            child: Text(
                              isSignIn
                                  ? "Dont't have an account?"
                                  : "Already have an account?",
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
