import 'package:dio/dio.dart';

class DioClient {
  Dio? _dio;

  DioClient() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://transit.xpertbotacademy.online/api',
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 3000),
      followRedirects: true,
      maxRedirects: 5,
    );
    _dio = Dio(options);
  }

  Dio getInstance() {
    return _dio!;
  }
}


