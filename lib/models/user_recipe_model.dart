class UserRecipeModel {
  bool? success;
  String? message;
  UserRecipeData? data;

  UserRecipeModel({this.success, this.message, this.data});

  UserRecipeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? UserRecipeData.fromJson(json['data']) : null;
  }
}

class UserRecipeData {
  List<Recipes>? recipes;

  UserRecipeData({this.recipes});

  UserRecipeData.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipes = <Recipes>[];
      json['recipes'].forEach((v) {
        recipes!.add(Recipes.fromJson(v));
      });
    }
  }
}

class Recipes {
  String? id;
  String? name;
  List<String>? nutrition;
  List<String>? ingredients;
  Measurements? measurements;
  Process? process;
  String? imageUrl;
  String? createdAt;

  Recipes(
      {this.id,
      this.name,
      this.nutrition,
      this.ingredients,
      this.measurements,
      this.process,
      this.imageUrl,
      this.createdAt});

  Recipes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nutrition = json['nutrition'].cast<String>();
    ingredients = json['ingredients'].cast<String>();
    measurements = json['measurements'] != null
        ? Measurements.fromJson(json['measurements'])
        : null;
    process =
        json['process'] != null ? Process.fromJson(json['process']) : null;
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
  }
}

class Measurements {
  List<MeasurementDetails>? measurementDetails;

  Measurements({
    this.measurementDetails,
  });

  Measurements.fromJson(Map<String, dynamic> json) {
    measurementDetails = [];
    for (var element in json.keys) {
      measurementDetails!.add(
        MeasurementDetails(
          item: element,
          amount: json[element],
        ),
      );
    }
  }
}

class Process {
  List<String>? processes;

  Process({
    this.processes,
  });

  Process.fromJson(Map<String, dynamic> json) {
    processes = [];
    for (var element in json.keys) {
      processes!.add(json[element]);
    }
  }
}

class MeasurementDetails {
  String? item;
  String? amount;
  MeasurementDetails({
    this.item,
    this.amount,
  });
}
