class ProfileModel {
  bool? success;
  String? message;
  ProfileData? data;

  ProfileModel({this.success, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }
}

class ProfileData {
  String? name;
  String? email;
  String? dp;
  List<String>? preferences;
  List<String>? allergies;
  List<String>? dietaryRestrictions;

  ProfileData(
      {this.name,
      this.email,
      this.dp,
      this.preferences,
      this.allergies,
      this.dietaryRestrictions});

  ProfileData.fromJson(Map<String, dynamic> json) {
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
