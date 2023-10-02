import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcamp/core/constants/app_constants.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/network/base_client.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/core/services/api_services.dart';
import 'package:vcamp/main.dart';
import 'package:vcamp/widgets/loader.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  void initState() {
    fetchApiEndpoint();
    super.initState();
  }

  fetchApiEndpoint() async {
    final response = await locator<BaseClient>().getRequest(
      baseUrl:
          "https://v-camp.s3.ap-south-1.amazonaws.com/public-images/host.json",
      path: "",
    );
    AppConstants.endpoint =
        response?.data['host'].replaceAll("http", "https") + "/api";
    await Future.delayed(
      const Duration(milliseconds: 300),
    );
    String? token =
        locator<SharedPreferences>().getString(AppConstants.accessToken);
    Navigator.of(navigatorKey.currentContext!).pushNamed(
      token != null ? AppRoutes.homeScreen : AppRoutes.loginScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Loader(),
      ),
    );
  }
}
