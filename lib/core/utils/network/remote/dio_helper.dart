import 'dart:convert';
import 'package:booking_app/core/utils/network/remote/end_points.dart';
import 'package:booking_app/data/models/api_response_model.dart';
import 'package:dio/dio.dart' show BaseOptions, Dio, Response;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DioHelper {
  static Dio? dio;
  static final JsonDecoder _decoder = new JsonDecoder();

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' '$token',
    };

    return await dio!
        .get(
      url,
      queryParameters: query,
    )
        .catchError((error) {
      print('error in getData Dio ${error.toString()}');
    });
  }

  static Future<ApiResponseModel> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    debugPrint('insidePost' );
    debugPrint('url== ${url}' );

    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

   var tmpResult = await dio!
        .post(
      baseUrl + url,
      queryParameters: query,
      data: data,
    )
        .catchError((error) {
      print('error in getData Dio ${error.toString()}');
    });

   debugPrint(tmpResult.statusCode.toString());

   ApiResponseModel result = ApiResponseModel.fromJson(tmpResult);

   return result;

  }

  static Future<dynamic> post(String url, {Map<String, String>? headers, body, encoding}) async {
    // print('here');
    // print(baseUrl + url);
    return http
        .post(Uri.parse(baseUrl + url),
        body: body,
        headers: headers,
        encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode >= 400 || json == null) {
        return false;
//        throw new Exception("Error while fetching data");
      }
      // print(statusCode);
      // print(res);
// return res;
      return _decoder.convert(res);

    });
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    return await dio!
        .put(
      url,
      queryParameters: query,
      data: data,
    )
        .catchError((error) {
      print('error in getData Dio ${error.toString()}');
    });
  }

  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' '$token',
    };

    return await dio!
        .patch(
      url,
      queryParameters: query,
      data: data,
    )
        .catchError((error) {
      print('error in patchData Dio ${error.toString()}');
    });
  }
}
