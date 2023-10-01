import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcamp/core/network/failure.dart';
import 'package:vcamp/core/services/api_services.dart';
import 'package:vcamp/models/user_recipe_model.dart';

part 'user_recipe_state.dart';

class UserRecipeCubit extends Cubit<UserRecipeState> {
  final ApiServices _client;
  UserRecipeCubit(this._client) : super(UserRecipeInitial());

  fetchUserRecipes() async {
    if (state is! UserRecipeFetchedState) {
      emit(UserRecipeFetchInProgress());
    }

    final response = await _client.fetchUserRecipes();
    emit(
      response.fold(
        (l) => UserRecipeFetchedState(
          userRecipes: l,
        ),
        (r) => UserRecipeFetchErrorState(
          failure: r,
        ),
      ),
    );
  }
}
