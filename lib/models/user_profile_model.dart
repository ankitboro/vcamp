import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  final bool success;
  final String message;
  final Data data;

  UserProfileModel({
    required this.success,
    required this.message,
    required this.data,
  });

  UserProfileModel copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      UserProfileModel(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final String name;
  final String email;
  final String? dp;
  final List<String> preferences;
  final List<String> allergies;
  final List<String> dietaryRestrictions;

  Data({
    required this.name,
    required this.email,
    required this.dp,
    required this.preferences,
    required this.allergies,
    required this.dietaryRestrictions,
  });

  Data copyWith({
    String? name,
    String? email,
    String? dp,
    List<String>? preferences,
    List<String>? allergies,
    List<String>? dietaryRestrictions,
  }) =>
      Data(
        name: name ?? this.name,
        email: email ?? this.email,
        dp: dp ?? this.dp,
        preferences: preferences ?? this.preferences,
        allergies: allergies ?? this.allergies,
        dietaryRestrictions: dietaryRestrictions ?? this.dietaryRestrictions,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        dp: json["dp"],
        preferences: List<String>.from(json["preferences"].map((x) => x)),
        allergies: List<String>.from(json["allergies"].map((x) => x)),
        dietaryRestrictions:
            List<String>.from(json["dietary_restrictions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "dp": dp,
        "preferences": List<dynamic>.from(preferences.map((x) => x)),
        "allergies": List<dynamic>.from(allergies.map((x) => x)),
        "dietary_restrictions":
            List<dynamic>.from(dietaryRestrictions.map((x) => x)),
      };
}

var dineshProfile = UserProfileModel(
  success: true,
  message: "User Profile Updated",
  data: Data(
    name: "Dinesh Bala",
    email: "dinesh@ramailo.tech",
    dp: "",
    preferences: ["momo", "egg"],
    allergies: ["peanut", "color"],
    dietaryRestrictions: ["fats", "sugar"],
  ),
);
