import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vcamp/core/network/failure.dart';

List<int> successStatusCodes = [200, 201, 202];

Future<Either<T, Failure>> getParsedData<T>(
    Response? response, dynamic fromJson) async {
  if (response != null && successStatusCodes.contains(response.statusCode)) {
    //handle success here
    if (response.data is Map && response.data['status-code'] == 1) {
      try {
        return Left(fromJson(response.data));
      } catch (e) {
        return Right(Failure.fromJson({}));
      }
    } else {
      if (response.data is String) {
        try {
          var data = jsonDecode(response.data);
          if (data['status-code'] == 1) {
            return Left(fromJson(data));
          } else {
            return Right(Failure.fromJson({}));
          }
        } catch (e) {
          return Right(Failure.fromJson(response.data));
        }
      } else {
        return Right(Failure.fromJson(response.data));
      }
    }
  } else {
    return Right(
      Failure.fromJson(
        response?.data ?? {},
      ),
    );
  }
}
