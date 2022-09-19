import 'package:auth_example/features/auth/ui/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
              context.read<AuthBloc>().add(AuthSignOutPressed());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<AuthBloc, AuthState, String>(
              selector: (state) {
                return state.user?.email ?? '';
              },
              builder: (context, email) {
                return Text(
                  'Welcome, $email',
                  style: Theme.of(context).textTheme.headline5,
                );
              },
            ),
            const SizedBox(height: 20),
            Image.asset('assets/images/success.png'),
          ],
        ),
      ),
    );
  }
}
