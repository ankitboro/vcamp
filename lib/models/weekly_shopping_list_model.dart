import 'dart:convert';

WeeklyShoppingList weeklyShoppingListFromJson(String str) =>
    WeeklyShoppingList.fromJson(json.decode(str));

String weeklyShoppingListToJson(WeeklyShoppingList data) =>
    json.encode(data.toJson());

class WeeklyShoppingList {
  final bool success;
  final String message;
  final Data data;

  WeeklyShoppingList({
    required this.success,
    required this.message,
    required this.data,
  });

  WeeklyShoppingList copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      WeeklyShoppingList(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory WeeklyShoppingList.fromJson(Map<String, dynamic> json) =>
      WeeklyShoppingList(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
      };
}

class Data {
  final Map<String, dynamic> shoppingListForWeek;

  Data({
    required this.shoppingListForWeek,
  });
}

var shoppingList = {
  "Corn": "500 grams",
  "Eggs": "12 pieces",
  "Lime": "4 pieces",
  "Milk": "2000 ml",
  "Rice": "1000 grams",
  "Salt": "200 grams",
  "Tofu": "500 grams",
  "Honey": "250 grams",
  "Celery": "500 grams",
  "Cheese": "500 grams",
  "Garlic": "100 grams",
  "Onions": "500 grams",
  "Pepper": "100 grams",
  "Quinoa": "500 grams",
  "Wasabi": "50 grams",
  "Almonds": "200 grams",
  "Bananas": "7 pieces",
  "Berries": "500 grams",
  "Carrots": "500 grams",
  "Spinach": "500 grams",
  "Avocados": "4 pieces",
  "Cilantro": "100 grams",
  "Cinnamon": "50 grams",
  "Tomatoes": "500 grams",
  "Zucchini": "500 grams",
  "Cucumbers": "4 pieces",
  "Mushrooms": "500 grams",
  "Olive Oil": "500 ml",
  "Soy Sauce": "200 ml",
  "Chia Seeds": "200 grams",
  "Almond Milk": "1000 ml",
  "Black Beans": "500 grams",
  "Pesto Sauce": "200 ml",
  "Bell Peppers": "500 grams",
  "Nori Seaweed": "30 sheets",
  "Marinara Sauce": "500 ml",
  "Pickled Ginger": "100 grams",
  "Vegetable Broth": "1000 ml",
  "Gluten-Free Oats": "500 grams",
  "Gluten-Free Bread": "1 loaf",
  "Gluten-Free Pasta": "500 grams"
};
