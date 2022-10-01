import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:booking_app/core/utils/network/remote/end_points.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ImageServices {
  static final ImageServices _instance = new ImageServices.internal();

  factory ImageServices() => _instance;

  ImageServices.internal();

  Future checkImageAssets(String path) async {
    try {
      return await rootBundle.load(path);
    } catch (_) {
      return null;
    }
  }

  Future<Uint8List?> byteGetImage(String picName) async {
    if (picName.isNotEmpty) {
      String rr = imgBaseUrl + picName.trim();
      // print(rr);
      var ii = await getImage(rr.trim());
      if (ii != false) {
        // print('bytes==');
        // print(ii);
        final Uint8List _logo = ii;
        return _logo;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<dynamic> getImage(String url) async {
    return http.get(Uri.parse(url)).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      // print('status' + statusCode.toString());
      if (statusCode < 200 || statusCode >= 400 || json == null) {
//        throw new Exception("Error while fetching data");
        return false;
      }

      return response.bodyBytes;
    });
  }
}
