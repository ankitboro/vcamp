class ProfileModel {
  bool? success;
  String? message;
  ProfieData? data;

  ProfileModel({this.success, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? ProfieData.fromJson(json['data']) : null;
  }
}

class ProfieData {
  String? name;
  String? email;
  String? dp;
  List<String>? preferences;
  List<String>? allergies;
  List<String>? dietaryRestrictions;

  ProfieData(
      {this.name,
      this.email,
      this.dp,
      this.preferences,
      this.allergies,
      this.dietaryRestrictions});

  ProfieData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    dp = json['dp'];
    preferences =
        json['preferences'] != null ? json['preferences'].cast<String>() : null;
    allergies =
        json['allergies'] != null ? json['allergies'].cast<String>() : null;
    dietaryRestrictions = json['dietary_restrictions'] != null
        ? json['dietary_restrictions'].cast<String>()
        : null;
  }
}
