import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcamp/core/network/failure.dart';
import 'package:vcamp/core/services/api_services.dart';
import 'package:vcamp/models/recipe_generated_model.dart';

part 'generate_recipe_state.dart';

class GenerateRecipeCubit extends Cubit<GenerateRecipeState> {
  final ApiServices _client;
  GenerateRecipeCubit(this._client) : super(GenerateRecipeInitial());

  generateRecipes(List<String> ingredients) async {
    emit(GeneratingRecipeState());

    final response = await _client.generateRecipes(ingredients);
    emit(
      response.fold(
        (l) => GeneratedRecipeState(
          data: l,
        ),
        (r) => RecipeGenerationFailedState(
          failure: r,
        ),
      ),
    );
  }
}
