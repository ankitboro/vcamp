import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vcamp/core/constants/app_colors.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/helpers/show_toast.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/core/services/api_services.dart';
import 'package:vcamp/core/services/google_services.dart';
import 'package:vcamp/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  _signIn() async {
    final response = await locator<GoogleServices>().signInWithGoogle();
    if (response != null) {
      final signInResponse = await locator<ApiServices>().signIn(response);
      signInResponse.fold(
        (l) {
          locator<ApiServices>().registerFcmToken();
          Navigator.of(navigatorKey.currentContext!).pushNamed(
            AppRoutes.homeScreen,
          );
        },
        (r) => showErrorToast(
          r.message!,
        ),
      );
    }
  }

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
              onPressed: () async {
                _signIn();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                fixedSize: const Size(double.maxFinite, 50),
                elevation: 0,
              ),
              child: const Text(
                "Sign in with Google",
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
