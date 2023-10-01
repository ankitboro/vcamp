import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcamp/blocs/generate_meal_plan_cubit/generate_meal_plan_cubit.dart';
import 'package:vcamp/blocs/generate_recipe_cubnit/generate_recipe_cubit.dart';
import 'package:vcamp/blocs/profile_cubit/profile_cubit.dart';
import 'package:vcamp/blocs/user_meal_plan_cubit/user_meal_plan_cubit.dart';
import 'package:vcamp/blocs/user_recipe_cuibit/user_recipe_cubit.dart';
import 'package:vcamp/core/network/base_client.dart';
import 'package:vcamp/core/services/api_services.dart';
import 'package:vcamp/core/services/google_services.dart';

final locator = GetIt.instance;

setupLocator() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(prefs);
  locator.registerFactory(
    () => BaseClient(),
  );
  locator.registerFactory(
    () => GoogleServices(),
  );
  locator.registerFactory(
    () => ApiServices(
      locator(),
    ),
  );

  //bloc and cubit
  locator.registerLazySingleton(
    () => GenerateShoppingListCubit(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => ProfileCubit(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => UserRecipeCubit(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GenerateRecipeCubit(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => UserMealPlanCubit(
      locator(),
    ),
  );
}
