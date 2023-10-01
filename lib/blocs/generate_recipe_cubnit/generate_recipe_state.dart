part of 'generate_recipe_cubit.dart';

sealed class GenerateRecipeState {}

final class GenerateRecipeInitial extends GenerateRecipeState {}

class GeneratingRecipeState extends GenerateRecipeState {}

class GeneratedRecipeState extends GenerateRecipeState {
  final RecipeGeneratedModel data;

  GeneratedRecipeState({
    required this.data,
  });
}

class RecipeGenerationFailedState extends GenerateRecipeState {
  final Failure failure;
  RecipeGenerationFailedState({
    required this.failure,
  });
}
