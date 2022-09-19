import 'package:auth_example/features/auth/ui/auth_screen.dart';
import 'package:auth_example/core/ui/failure_screen.dart';
import 'package:auth_example/features/home_screen.dart';
import 'package:flutter/material.dart';

import '../core/utils/fade_page_route.dart';

final _appRoutes = {
  '/': const AuthScreen(),
  AuthScreen.routeName: const AuthScreen(),
  HomeScreen.routeName: const HomeScreen(),
  FailureScreen.routeName: const FailureScreen(),
};

Route onGenerateRoute(RouteSettings routeSettings) {
  return FadePageRoute(_appRoutes[routeSettings.name]);
}
