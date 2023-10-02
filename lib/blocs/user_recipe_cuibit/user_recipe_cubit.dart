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
          // userRecipes: l,
          userRecipes: UserRecipeModel.fromJson({
  "success": true,
  "message": "User Recipes",
  "data": {
    "recipes": [
      {
        "id": "aa0cf842-581f-4ef5-a442-46f84420d1be",
        "name": "Vegetarian Sushi Bowl",
        "nutrition": [
          "Calories: 550 kcal",
          "Protein: 12 g",
          "Carbohydrates: 105 g",
          "Fat: 10 g",
          "Fiber: 10 g",
          "Sugar: 8 g"
        ],
        "ingredients": [
          "Rice",
          "Egg",
          "Vegetables",
          "Avocado"
        ],
        "measurements": {
          "Egg": "50 grams",
          "Rice": "200 grams",
          "Avocado": "100 grams",
          "Vegetables": "100 grams"
        },
        "process": {
          "Step 1": "Cook the rice according to the package instructions and let it cool.",
          "Step 2": "While the rice is cooking, prepare the vegetables. You can use any vegetables you like, such as cucumber, carrot, or bell pepper. Cut them into thin strips.",
          "Step 3": "Cook the egg in a pan over medium heat until it's done to your liking. You can make it scrambled or fried.",
          "Step 4": "Slice the avocado.",
          "Step 5": "Assemble the bowl. Start with a base of rice, then add the vegetables, egg, and avocado on top. You can also add some soy sauce or sesame seeds for extra flavor."
        },
        "image_url": "https://v-camp.s3.amazonaws.com/public-images/081fb6ed-b012-497a-971d-dda7a02b08eb.jpg",
        "created_at": "2023-10-01T15:46:28.806648+05:45"
      },
      {
        "id": "3b404e44-3ce3-487d-8258-1e073a1ccc9a",
        "name": "Vegetable Fried Rice",
        "nutrition": [
          "Calories: 350 kcal",
          "Protein: 10 g",
          "Carbohydrates: 50 g",
          "Fat: 10 g",
          "Fiber: 4 g",
          "Sugar: 4 g"
        ],
        "ingredients": [
          "rice",
          "egg",
          "vegetables"
        ],
        "measurements": {
          "egg": "50 grams",
          "rice": "200 grams",
          "vegetables": "100 grams"
        },
        "process": {
          "Step 1": "Cook the rice according to the package instructions and set aside.",
          "Step 2": "In a large pan or wok, heat some oil over medium heat. Add the vegetables and stir-fry until they are tender.",
          "Step 3": "Push the vegetables to one side of the pan and crack the eggs into the other side. Scramble the eggs and mix with the vegetables.",
          "Step 4": "Add the cooked rice to the pan and stir everything together. Season with soy sauce and sesame oil. Serve hot."
        },
        "image_url": "https://v-camp.s3.amazonaws.com/public-images/2a761c48-a5de-4938-a833-afe053ac1b2a.jpg",
        "created_at": "2023-10-01T15:10:53.449973+05:45"
      }
    ]
  }
})
        ),
        (r) => UserRecipeFetchErrorState(
          failure: r,
        ),
      ),
    );
  }
}
