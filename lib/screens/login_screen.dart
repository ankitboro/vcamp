import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vcamp/core/constants/app_colors.dart';
import 'package:vcamp/core/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "Hello, VCampers",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 32),
            SvgPicture.asset(
              "assets/diet_plan.svg",
              height: 200,
            ),
            const SizedBox(height: 24),
            const Text(
              "Vcamper: Where Flavor Meets Functionality! Discover recipes, plan meals, and conquer the grocery store effortlessly. Your culinary adventure begins here",
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.homeScreen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                fixedSize: const Size(double.maxFinite, 50),
                elevation: 0,
              ),
              child: const Text("Sign in with Google"),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
