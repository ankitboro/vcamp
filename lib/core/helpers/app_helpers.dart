import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/main.dart';

logout() {
  locator<SharedPreferences>().clear();
  Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
    AppRoutes.loginScreen,
    (route) => false,
  );
}
