import 'package:flutter/material.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/models/profile_model.dart';
import 'package:vcamp/screens/generate_recipe_screen.dart';
import 'package:vcamp/screens/screens.dart';
import 'package:vcamp/screens/update_profile_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // Object? argument = settings.arguments;
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
    case AppRoutes.shoppingListScreen:
      return MaterialPageRoute(
        builder: (context) => const ShoppingListScreen(),
      );
    case AppRoutes.generateRecipeScreen:
      return MaterialPageRoute(
        builder: (context) => const GenerateRecipeScreen(),
      );
    case AppRoutes.updateProfileScreen:
      final args = settings.arguments as ProfileModel;
      return MaterialPageRoute(
        builder: (context) =>  UpdateProfileScreen(profileData: args.data),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
  }
}
