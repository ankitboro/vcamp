import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcamp/core/constants/app_constants.dart';
import 'package:vcamp/core/helpers/service_locator.dart';

Map<String, String> getHeader() {
  String? accessToken =
      locator<SharedPreferences>().getString(AppConstants.accessToken);
  return {
    "Content-Type": "application/json",
    if (accessToken != null) "token": accessToken,
  };
}
