import 'dart:convert';

import 'package:dio/dio.dart';
//http as http
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper() {
    setUpOptions();
  }
  Dio _dio = Dio();

  late BaseOptions baseOptions;

  setUpOptions() async {
    baseOptions = BaseOptions(
      baseUrl: 'https://inshortsapi.vercel.app/news?category=',
      connectTimeout: 30000,
      receiveTimeout: 30000,
      validateStatus: (status) {
        return status! < 500;
      },
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.add(LogInterceptor(requestBody: true));
  }

  Future<Response<dynamic>> getRequest(String path) async {
    try {
      final result = await _dio.get(
        path,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
