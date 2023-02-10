import 'package:flutter/material.dart';
import 'package:news_app/core/exceptions/route_exception.dart';
import 'package:news_app/presentation/screens/Auth/sign_in_screen.dart';

class AppRouter {
  static const String counter = 'counter';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case counter:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );

      default:
        throw const RouteException('Route not found!');
    }
  }
}
