import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcamp/core/network/base_client.dart';

final locator = GetIt.instance;

setupLocator() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(prefs);
  locator.registerFactory(
    () => BaseClient(),
  );
}
