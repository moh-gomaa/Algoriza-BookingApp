import 'package:dio/dio.dart' show BaseOptions, Dio, Response;

class DioHelper2 {
  static Dio? dio;

  static void init(){
    dio = Dio(
      BaseOptions(
        baseUrl:'http://api.mahmoudtaha.com/api',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String , dynamic>? query,
    String? token ,
  }) async{

    dio!.options.headers = {
      'Content-Type':'application/json',
      'token': token??'',
    };

    return await dio!.get(
      url,
      queryParameters: query,
    ).catchError((error) {
      print('error in getData Dio ${error.toString()}');
    });
  }

  static Future<Response> postData({
    required String url,
    Map<String , dynamic>? query,
    required Map<String , dynamic> data,
    String? token ,
  }) async{

    dio!.options.headers = {
      'token': token??'',
    };

    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    ).catchError((error) {
      print('error in getData Dio ${error.toString()}');
    });
  }

  static Future<Response> putData({
    required String url,
    Map<String , dynamic>? query,
    required Map<String , dynamic> data,
    String? token ,
  }) async{

    dio!.options.headers = {
      'Content-Type':'application/json',
      'Authorization': token??'',
    };

    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    ).catchError((error) {
      print('error in getData Dio ${error.toString()}');
    });
  }

  static Future<Response> patchData({
    required String url,
    Map<String , dynamic>? query,
    required Map<String , dynamic> data,
    String? token ,
  }) async{

    dio!.options.headers = {
      'Content-Type':'application/json',
      'Authorization': 'Bearer ''$token',
    };

    return await dio!.patch(
      url,
      queryParameters: query,
      data: data,
    ).catchError((error) {
      print('error in patchData Dio ${error.toString()}');
    });
  }

}