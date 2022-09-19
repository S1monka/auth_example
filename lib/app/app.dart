import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:auth_example/app/theme_config.dart';

import 'package:auth_example/features/home_screen.dart';

class StartTemplate extends StatelessWidget {
  const StartTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: BotToastInit(),
      theme: themeData,
      home: const HomeScreen(),
    );
  }
}
