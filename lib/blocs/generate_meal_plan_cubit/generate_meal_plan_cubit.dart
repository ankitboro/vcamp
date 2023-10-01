import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcamp/core/network/failure.dart';
import 'package:vcamp/core/services/api_services.dart';

part 'generate_meal_plan_state.dart';

class GenerateShoppingListCubit extends Cubit<GenerateShoppingListState> {
  final ApiServices _service;
  GenerateShoppingListCubit(this._service)
      : super(GenerateShoppingListPlanInitial());

  generateShoppingList() async {
    final response = await _service.generateShoppingList();
    emit(
      response.fold(
        (l) => GeneratedShoppingListState(
          mealPlan: l['shopping_list_for_week'] ?? {},
        ),
        (r) => GeneratedShoppingListFailedState(
          failure: r,
        ),
      ),
    );
  }
}
