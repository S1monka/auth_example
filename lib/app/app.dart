import 'package:auth_example/features/auth/bloc/auth_bloc.dart';
import 'package:auth_example/features/auth/ui/auth_screen.dart';
import 'package:auth_example/core/ui/failure_screen.dart';
import 'package:auth_example/features/home_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:auth_example/app/theme_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/injection.dart';
import 'navigator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: const StartTemplate(),
    );
  }
}

class StartTemplate extends StatefulWidget {
  const StartTemplate({super.key});

  @override
  State<StartTemplate> createState() => _StartTemplateState();
}

class _StartTemplateState extends State<StartTemplate> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.failure != null) {
              _navigator.pushNamed(FailureScreen.routeName);
            }

            if (state.isAuthed) {
              _navigator.pushReplacementNamed(HomeScreen.routeName);
            }
          },
          child: botToastBuilder(context, child),
        );
      },
      theme: themeData,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: _navigatorKey,
    );
  }
}
