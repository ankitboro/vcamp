import 'package:flutter/material.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/screens/screens.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  Object? argument = settings.arguments;
  switch (settings.name) {
    case AppRoutes.loginScreen:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case AppRoutes.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case AppRoutes.recipeScreen:
      return MaterialPageRoute(
        builder: (context) => const RecipeScreen(),
      );
    case AppRoutes.recipeDetailScreen:
      return MaterialPageRoute(
        builder: (context) => const RecipeDetailScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
  }
}
