part of 'generate_meal_plan_cubit.dart';

sealed class GenerateShoppingListState {}

final class GenerateShoppingListPlanInitial extends GenerateShoppingListState {}

class GeneratedShoppingListState extends GenerateShoppingListState {
  final Map<String, dynamic> mealPlan;
  GeneratedShoppingListState({
    required this.mealPlan,
  });
}

class GeneratedShoppingListFailedState extends GenerateShoppingListState {
  final Failure failure;
  GeneratedShoppingListFailedState({
    required this.failure,
  });
}
