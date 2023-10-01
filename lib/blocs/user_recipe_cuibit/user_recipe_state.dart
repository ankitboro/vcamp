part of 'user_recipe_cubit.dart';

sealed class UserRecipeState {}

final class UserRecipeInitial extends UserRecipeState {}

class UserRecipeFetchedState extends UserRecipeState {
  final UserRecipeModel userRecipes;

  UserRecipeFetchedState({
    required this.userRecipes,
  });
}

class UserRecipeFetchErrorState extends UserRecipeState {
  final Failure failure;
  UserRecipeFetchErrorState({
    required this.failure,
  });
}
