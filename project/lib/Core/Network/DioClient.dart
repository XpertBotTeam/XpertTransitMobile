
import 'package:dio/dio.dart';

class DioClient{
  Dio getInstance(){
    return Dio(BaseOptions(
      baseUrl: "https://1569-213-204-101-56.ngrok-free.app/api",
      connectTimeout: Duration(seconds:20),
      receiveTimeout: Duration(seconds:3),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json
    )
    );
  }
}
