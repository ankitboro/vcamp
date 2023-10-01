import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcamp/core/constants/app_constants.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/network/base_client.dart';
import 'package:vcamp/core/network/failure.dart';
import 'package:vcamp/core/network/get_parsed_data.dart';
import 'package:vcamp/core/network/success.dart';

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

  Future<Either<Success, Failure>> registerFcmToken(String fcmToken) async {
    final response = await _client.postRequest(path: "/set-fcm-token/", data: {
      "fcm-token": fcmToken,
    });
    // return getParsedData(response, );
    return getParsedData(
      response,
      Success.fromJson,
    );
  }
}
