import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcamp/core/constants/app_constants.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/helpers/show_loading_dialog.dart';
import 'package:vcamp/core/network/header.dart';

class BaseClient {
  Future<Response<dynamic>?> getRequest({
    String baseUrl = "",
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? queryParameters,
    required String path,
    bool showLoadingDialog = false,
    bool shouldCache = true,
  }) async {
    Response? response;
    // if (showLoadingDialog) displayLoadingDialog();
    try {
      Map<String, String> header = getHeader();
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }

      final Dio dio = Dio();
      addInterceptor(dio);
      addCertificate(dio);
      response = await dio.get(
        baseUrl.isNotEmpty ? baseUrl + path : AppConstants.endpoint + path,
        queryParameters: queryParameters,
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ),
      );
      if (shouldCache && response.data['status-code'] == 1) {
        locator<SharedPreferences>().setString(
          path,
          jsonEncode(response.data).toString(),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        //TODO: LOGOUt
        // logOut();
      } else if (shouldCache) {
        // response = getCachedResponse(path);
      }
    } catch (e) {
      if (shouldCache && e is SocketException) {
        // response = getCachedResponse(path);
      }
    }
    // if (showLoadingDialog) hideLoadingDialog();
    return response;
  }

  Future<Response?> postRequest({
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? data,
    required String path,
    bool displayDialog = false,
  }) async {
    Response? response;
    if (displayDialog) {
      showLoadingDialog();
    }
    try {
      Map<String, String> header = getHeader();
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }
      final Dio dio = Dio();
      addInterceptor(dio);
      addCertificate(dio);
      response = await dio.post(
        AppConstants.endpoint + path,
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ),
        data: data,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // debugLog(e.toString());

        // logOut();
      }
      return e.response;
    } catch (e) {
      // debugLog(e.toString());
    }
    if (displayDialog) hideLoadingDialog();
    return response;
  }

  Future<Response?> patchRequest({
    String baseUrl = "",
    Map<String, String>? optionalHeaders,
    Map<String, dynamic>? data,
    required String path,
    bool showLoadingDialog = false,
  }) async {
    Response? response;
    // if (showLoadingDialog) displayLoadingDialog();
    try {
      Map<String, String> header = getHeader();
      if (optionalHeaders != null) {
        header.addAll(optionalHeaders);
      }
      final Dio dio = Dio();
      addInterceptor(dio);
      addCertificate(dio);
      response = await dio.patch(
        AppConstants.endpoint + path,
        options: Options(
          headers: header,
          sendTimeout: const Duration(seconds: 40),
          receiveTimeout: const Duration(seconds: 40),
        ),
        data: data,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // debugLog(e.toString());

        // logOut();
      }
    } catch (e) {
      // debugLog(e.toString());
    }
    // if (showLoadingDialog) hideLoadingDialog();
    return response;
  }
}

addInterceptor(Dio dio) {
  if (kDebugMode) {
    dio.interceptors.add(
      PrettyDioLogger(
        error: true,
        requestBody: true,
        requestHeader: false,
        request: true,
        responseBody: false,
      ),
    );
  }
}

addCertificate(Dio dio) {
  // ignore: deprecated_member_use
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient dioClient) {
    dioClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    return dioClient;
  };
}
