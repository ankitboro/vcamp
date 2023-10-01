class RecipeGeneratedModel {
  bool? success;
  String? message;

  RecipeGeneratedModel({this.success, this.message});

  RecipeGeneratedModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }
}
