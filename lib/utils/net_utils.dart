import 'package:dio/dio.dart';

import 'package:yne_flutter/app_config.dart';

enum DioMethod { get, post, patch, put, delete }

class NetUtils {
  static NetUtils? _instance;
  late Dio _dio;

  _init() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 6),
      receiveTimeout: const Duration(seconds: 6),
    );

    _dio = Dio(options);

    _dio.options.headers["Access-Control-Allow-Origin"] = "*";
    _dio.options.headers["Access-Control-Allow-Credentials"] = true;
    _dio.options.headers["Access-Control-Allow-Headers"] =
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
    _dio.options.headers["Access-Control-Allow-Methods"] =
        "GET, HEAD, POST, PATCH, OPTIONS";
  }

  NetUtils._internal() {
    _instance = this;
    _init();
  }

  factory NetUtils() => _instance ?? NetUtils._internal();

  Future<Map<String, dynamic>> reqeustData(
      {required DioMethod method,
      required String path,
      Map<String, dynamic>? queryParameters,
      dynamic postData,
      String token = ''}) async {
    try {
      if (token.isNotEmpty) {
        _dio.options.headers['Authorization'] = 'Token $token';
      }

      Response response;
      if (method == DioMethod.get) {
        response = await _dio.get(path, queryParameters: queryParameters);
      } else if (method == DioMethod.post) {
        response = await _dio.post(path, data: postData);
      } else if (method == DioMethod.patch) {
        response = await _dio.patch(path, data: postData);
      } else if (method == DioMethod.put) {
        response = await _dio.put(path, data: postData);
      } else if (method == DioMethod.delete) {
        response = await _dio.delete(path, data: postData);
      } else {
        throw Exception('Unknown DioMethod');
      }

      return response.data;
    } on DioError catch (e) {
      // DioError only return error 500
      log.e(e.response?.data['message']);

      String message = e.response?.data['message'] ?? e.message;
      if (e.type == DioErrorType.connectionTimeout) {
        message = "Connection Timeout".hcd;
      } else if (e.type == DioErrorType.receiveTimeout) {
        message = "Receive Timeout".hcd;
      } else if (e.type == DioErrorType.receiveTimeout) {
        message = "404 server not found ${e.response?.statusCode}".hcd;
      }

      return Future.error(message);
    } catch (error) {
      log.e(error);
      return Future.error(error);
    }
  }
}
