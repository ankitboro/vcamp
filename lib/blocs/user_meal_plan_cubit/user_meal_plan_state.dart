part of 'user_meal_plan_cubit.dart';

sealed class UserMealPlanState {}

final class UserMealPlanInitial extends UserMealPlanState {}

class UserMealPlanFetchedState extends UserMealPlanState {
  final UserMealPlanModel userMealPlan;

  UserMealPlanFetchedState({
    required this.userMealPlan,
  });
}

class UserMealPlanfetchErrorState extends UserMealPlanState {
  final Failure failure;
  UserMealPlanfetchErrorState({
    required this.failure,
  });
}
