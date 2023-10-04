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

class UserMealPlanGenerateSuccessState extends UserMealPlanState {
  final String message;
  UserMealPlanGenerateSuccessState({
    required this.message,
  });
}

class UserMealPlanGenerateFailureState extends UserMealPlanState {
  final String errorMsg;
  UserMealPlanGenerateFailureState({
    required this.errorMsg,
  });
}
