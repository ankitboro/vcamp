import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcamp/core/constants/app_constants.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/network/base_client.dart';
import 'package:vcamp/core/network/failure.dart';
import 'package:vcamp/core/network/get_parsed_data.dart';
import 'package:vcamp/core/network/success.dart';
import 'package:vcamp/core/services/google_services.dart';
import 'package:vcamp/models/profile_model.dart';

class ApiServices {
  final BaseClient _client;
  ApiServices(this._client);

  Future<Either<Success, Failure>> signIn(String userToken) async {
    final response = await _client.postRequest(
      path: "/auth/",
      data: {
        "token": userToken,
      },
    );
    if (response?.statusCode == 200 &&
        response?.data['data'] != null &&
        response?.data['data']['access_token'] != null) {
      locator<SharedPreferences>().setString(
          AppConstants.accessToken, response!.data['data']['access_token']);
    }
    return getParsedData(
      response,
      Success.fromJson,
    );
  }

  Future<void> registerFcmToken() async {
    final fcmToken = await locator<GoogleServices>().getFcmToken();
    if (fcmToken != null) {
      await _client.postRequest(
        path: "/set-fcm-token/",
        data: {
          "fcm-token": fcmToken,
        },
      );
    }
  }

  Future<Either<Map<String, dynamic>, Failure>> generateShoppingList() async {
    final response = await _client.getRequest(
      path: "/user/shopping-list/",
    );
    return getParsedData(
      response,
      Success.fromJson,
      returnMapBody: true,
    );
  }

  Future<Either<ProfileModel, Failure>> fetchProfile() async {
    final response = await _client.getRequest(
      path: "/user/profile",
    );
    return getParsedData(
      response,
      ProfileModel.fromJson,
    );
  }
}
