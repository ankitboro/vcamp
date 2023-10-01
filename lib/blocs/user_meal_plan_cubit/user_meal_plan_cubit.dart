import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcamp/core/network/failure.dart';
import 'package:vcamp/core/services/api_services.dart';
import 'package:vcamp/models/user_meal_plan_model.dart';

part 'user_meal_plan_state.dart';

class UserMealPlanCubit extends Cubit<UserMealPlanState> {
  final ApiServices _client;
  UserMealPlanCubit(this._client) : super(UserMealPlanInitial());

  fetchUserMealPlan() async {
    if (state is! UserMealPlanFetchedState) {
      emit(UserMealPlanInitial());
    }
    final response = await _client.fetchUserMealPlan();
    emit(
      response.fold(
        (l) => UserMealPlanFetchedState(
          userMealPlan: UserMealPlanModel.fromJson({
            "success": true,
            "message": "Meal Plan For A Week",
            "data": {
              "week_meal_plan": {
                "ingredients": [
                  "Avocado",
                  "Rice",
                  "Seaweed",
                  "Soy Sauce",
                  "Wasabi",
                  "Pickled Ginger",
                  "Cucumber",
                  "Carrots",
                  "Bell Peppers",
                  "Quinoa",
                  "Black Beans",
                  "Corn",
                  "Tomatoes",
                  "Lettuce",
                  "Olive Oil",
                  "Lemon",
                  "Garlic",
                  "Onions",
                  "Spinach",
                  "Mushrooms",
                  "Tofu",
                  "Sesame Oil",
                  "Rice Vinegar",
                  "Chickpeas",
                  "Sweet Potatoes",
                  "Broccoli",
                  "Almond Milk",
                  "Oats",
                  "Berries",
                  "Bananas",
                  "Chia Seeds",
                  "Maple Syrup",
                  "Almonds",
                  "Walnuts",
                  "Flax Seeds"
                ],
                "Sun": {
                  "Lunch": {
                    "name": "Vegetarian Sushi Rolls",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/e38b8732-c896-4fa8-945d-5f56f96ed540.jpg",
                    "nutrition": [
                      "Calories: 350 kcal",
                      "Protein: 8 g",
                      "Carbohydrates: 70 g",
                      "Fat: 5 g",
                      "Fiber: 6 g",
                      "Sugar: 6 g"
                    ]
                  },
                  "Dinner": {
                    "name": "Stir-Fried Tofu with Vegetables",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/c62dfa09-2590-4583-8a14-82ab9a3241da.jpg",
                    "nutrition": [
                      "Calories: 450 kcal",
                      "Protein: 20 g",
                      "Carbohydrates: 50 g",
                      "Fat: 15 g",
                      "Fiber: 10 g",
                      "Sugar: 10 g"
                    ]
                  },
                  "Breakfast": {
                    "name": "Berry Banana Smoothie",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/14fd4e24-4c91-4755-8283-6b9c4fbcd251.jpg",
                    "nutrition": [
                      "Calories: 250 kcal",
                      "Protein: 5 g",
                      "Carbohydrates: 50 g",
                      "Fat: 3 g",
                      "Fiber: 7 g",
                      "Sugar: 35 g"
                    ]
                  }
                },
                "Mon": {
                  "Lunch": {
                    "name": "Vegetarian Sushi Rolls",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/5a3857d1-f217-4607-bf43-df01c2bb167a.jpg",
                    "nutrition": [
                      "Calories: 350 kcal",
                      "Protein: 8 g",
                      "Carbohydrates: 70 g",
                      "Fat: 5 g",
                      "Fiber: 6 g",
                      "Sugar: 6 g"
                    ]
                  },
                  "Dinner": {
                    "name": "Quinoa Black Bean Salad",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/653d52db-d72c-4039-9dbd-a8de0f7fdaa8.jpg",
                    "nutrition": [
                      "Calories: 400 kcal",
                      "Protein: 15 g",
                      "Carbohydrates: 60 g",
                      "Fat: 10 g",
                      "Fiber: 15 g",
                      "Sugar: 5 g"
                    ]
                  },
                  "Breakfast": {
                    "name": "Avocado Toast on Gluten-Free Bread",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/76bd6bb1-5241-4f46-b8c1-4c937f008613.jpg",
                    "nutrition": [
                      "Calories: 300 kcal",
                      "Protein: 10 g",
                      "Carbohydrates: 30 g",
                      "Fat: 15 g",
                      "Fiber: 10 g",
                      "Sugar: 2 g"
                    ]
                  }
                },
                "Tue": {
                  "Lunch": {
                    "name": "Avocado Sushi Rolls",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/846867c4-433d-4ada-8206-b4f8edd60638.jpg",
                    "nutrition": [
                      "Calories: 350 kcal",
                      "Protein: 8 g",
                      "Carbohydrates: 70 g",
                      "Fat: 5 g",
                      "Fiber: 6 g",
                      "Sugar: 6 g"
                    ]
                  },
                  "Dinner": {
                    "name": "Stir-Fried Tofu with Vegetables",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/90fd67fe-a76d-4a8f-9e63-8b1f1620b79c.jpg",
                    "nutrition": [
                      "Calories: 450 kcal",
                      "Protein: 20 g",
                      "Carbohydrates: 50 g",
                      "Fat: 15 g",
                      "Fiber: 10 g",
                      "Sugar: 10 g"
                    ]
                  },
                  "Breakfast": {
                    "name": "Berry Banana Smoothie",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/921f431d-383e-426c-acbb-0db3860c7a49.jpg",
                    "nutrition": [
                      "Calories: 250 kcal",
                      "Protein: 5 g",
                      "Carbohydrates: 50 g",
                      "Fat: 3 g",
                      "Fiber: 7 g",
                      "Sugar: 35 g"
                    ]
                  }
                },
                "Wed": {
                  "Lunch": {
                    "name": "Vegetarian Sushi Rolls",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/4f9dffd9-5016-4525-96bb-e54fd059f165.jpg",
                    "nutrition": [
                      "Calories: 350 kcal",
                      "Protein: 8 g",
                      "Carbohydrates: 70 g",
                      "Fat: 5 g",
                      "Fiber: 6 g",
                      "Sugar: 6 g"
                    ]
                  },
                  "Dinner": {
                    "name": "Sweet Potato and Chickpea Buddha Bowl",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/27baece4-4f1d-42f9-82fc-e14a71b64592.jpg",
                    "nutrition": [
                      "Calories: 500 kcal",
                      "Protein: 15 g",
                      "Carbohydrates: 80 g",
                      "Fat: 10 g",
                      "Fiber: 15 g",
                      "Sugar: 10 g"
                    ]
                  },
                  "Breakfast": {
                    "name": "Overnight Oats with Berries",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/7b1eab6a-efdc-40f3-8105-03fa99b129c3.jpg",
                    "nutrition": [
                      "Calories: 350 kcal",
                      "Protein: 10 g",
                      "Carbohydrates: 60 g",
                      "Fat: 7 g",
                      "Fiber: 10 g",
                      "Sugar: 20 g"
                    ]
                  }
                },
                "Thu": {
                  "Lunch": {
                    "name": "Avocado Sushi Rolls",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/24322f44-4b89-4bd8-a2a1-b15618777809.jpg",
                    "nutrition": [
                      "Calories: 350 kcal",
                      "Protein: 8 g",
                      "Carbohydrates: 70 g",
                      "Fat: 5 g",
                      "Fiber: 6 g",
                      "Sugar: 6 g"
                    ]
                  },
                  "Dinner": {
                    "name": "Quinoa Stuffed Bell Peppers",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/b4c4f858-f7c3-41eb-96ce-722ae91f0744.jpg",
                    "nutrition": [
                      "Calories: 400 kcal",
                      "Protein: 15 g",
                      "Carbohydrates: 60 g",
                      "Fat: 10 g",
                      "Fiber: 10 g",
                      "Sugar: 10 g"
                    ]
                  },
                  "Breakfast": {
                    "name": "Avocado Smoothie",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/ad006084-8afe-4d01-86d7-6d17d2486a2c.jpg",
                    "nutrition": [
                      "Calories: 300 kcal",
                      "Protein: 5 g",
                      "Carbohydrates: 30 g",
                      "Fat: 20 g",
                      "Fiber: 10 g",
                      "Sugar: 10 g"
                    ]
                  }
                },
                "Fri": {
                  "Lunch": {
                    "name": "Vegetarian Sushi Rolls",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/5d942911-8459-452c-b202-f145eda6b82d.jpg",
                    "nutrition": [
                      "Calories: 350 kcal",
                      "Protein: 8 g",
                      "Carbohydrates: 70 g",
                      "Fat: 5 g",
                      "Fiber: 6 g",
                      "Sugar: 6 g"
                    ]
                  },
                  "Dinner": {
                    "name": "Broccoli and Tofu Stir Fry",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/bbcc1e59-8fe5-4fed-852f-ef0976924d91.jpg",
                    "nutrition": [
                      "Calories: 450 kcal",
                      "Protein: 20 g",
                      "Carbohydrates: 50 g",
                      "Fat: 15 g",
                      "Fiber: 10 g",
                      "Sugar: 10 g"
                    ]
                  },
                  "Breakfast": {
                    "name": "Chia Pudding with Berries",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/f83c945e-51f8-40ad-838c-52f6696a2141.jpg",
                    "nutrition": [
                      "Calories: 300 kcal",
                      "Protein: 10 g",
                      "Carbohydrates: 40 g",
                      "Fat: 10 g",
                      "Fiber: 15 g",
                      "Sugar: 15 g"
                    ]
                  }
                },
                "Sat": {
                  "Lunch": {
                    "name": "Avocado Sushi Rolls",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/c7fa6954-19d0-4c61-b00f-c81efeec96e7.jpg",
                    "nutrition": [
                      "Calories: 350 kcal",
                      "Protein: 8 g",
                      "Carbohydrates: 70 g",
                      "Fat: 5 g",
                      "Fiber: 6 g",
                      "Sugar: 6 g"
                    ]
                  },
                  "Dinner": {
                    "name": "Quinoa Black Bean Salad",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/bc6f955c-7ab7-47a1-8264-699b5ed3c8c6.jpg",
                    "nutrition": [
                      "Calories: 400 kcal",
                      "Protein: 15 g",
                      "Carbohydrates: 60 g",
                      "Fat: 10 g",
                      "Fiber: 15 g",
                      "Sugar: 5 g"
                    ]
                  },
                  "Breakfast": {
                    "name": "Avocado Toast on Gluten-Free Bread",
                    "image_url":
                        "https://v-camp.s3.amazonaws.com/public-images/ececa3c0-3d97-4a9b-a052-caeed0bd2a6c.jpg",
                    "nutrition": [
                      "Calories: 300 kcal",
                      "Protein: 10 g",
                      "Carbohydrates: 30 g",
                      "Fat: 15 g",
                      "Fiber: 10 g",
                      "Sugar: 2 g"
                    ]
                  }
                }
              }
            }
          }),
        ),
        (r) => UserMealPlanfetchErrorState(
          failure: r,
        ),
      ),
    );
  }
}
