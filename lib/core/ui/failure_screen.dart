import 'package:auth_example/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FailureScreen extends StatelessWidget {
  static const routeName = '/error';
  const FailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/fail.png',
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            child: BlocSelector<AuthBloc, AuthState, String>(
              selector: (state) {
                return state.failure?.message ?? '';
              },
              builder: (context, failure) {
                return Text(
                  failure,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white,
                    shadows: [
                      const Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 3.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
