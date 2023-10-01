class UserMealPlanModel {
  bool? success;
  String? message;
  UserMealData? data;

  UserMealPlanModel({this.success, this.message, this.data});

  UserMealPlanModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? UserMealData.fromJson(json['data']) : null;
  }
}

class UserMealData {
  WeekMealPlan? weekMealPlan;

  UserMealData({this.weekMealPlan});

  UserMealData.fromJson(Map<String, dynamic> json) {
    weekMealPlan = json['week_meal_plan'] != null
        ? WeekMealPlan.fromJson(json['week_meal_plan'])
        : null;
  }
}

class WeekMealPlan {
  List<String>? ingredients;
  Day? sun;
  Day? mon;
  Day? tue;
  Day? wed;
  Day? thu;
  Day? fri;
  Day? sat;

  WeekMealPlan({
    this.ingredients,
    this.sun,
    this.mon,
    this.tue,
    this.wed,
    this.thu,
    this.fri,
    this.sat,
  });

  WeekMealPlan.fromJson(Map<String, dynamic> json) {
    ingredients = json['ingredients'].cast<String>();
    sun = json['Sun'] != null ? Day.fromJson(json['Sun']) : null;
    mon = json['Mon'] != null ? Day.fromJson(json['Mon']) : null;
    tue = json['Tue'] != null ? Day.fromJson(json['Tue']) : null;
    wed = json['Wed'] != null ? Day.fromJson(json['Wed']) : null;
    thu = json['Thu'] != null ? Day.fromJson(json['Thu']) : null;
    fri = json['Fri'] != null ? Day.fromJson(json['Fri']) : null;
    sat = json['Sat'] != null ? Day.fromJson(json['Sat']) : null;
  }
}

class Day {
  Lunch? lunch;
  Lunch? dinner;
  Lunch? breakfast;

  Day({this.lunch, this.dinner, this.breakfast});

  Day.fromJson(Map<String, dynamic> json) {
    lunch = json['Lunch'] != null ? Lunch.fromJson(json['Lunch']) : null;
    dinner = json['Dinner'] != null ? Lunch.fromJson(json['Dinner']) : null;
    breakfast =
        json['Breakfast'] != null ? Lunch.fromJson(json['Breakfast']) : null;
  }
}

class Lunch {
  String? name;
  String? imageUrl;
  List<String>? nutrition;

  Lunch({this.name, this.imageUrl, this.nutrition});

  Lunch.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['image_url'];
    nutrition = json['nutrition'].cast<String>();
  }
}
