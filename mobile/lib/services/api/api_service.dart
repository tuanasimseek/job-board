import 'package:dio/dio.dart';

class ApiService {
  late final Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://api.example.com",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("REQUEST: ${options.method} ${options.path}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("RESPONSE: ${response.statusCode}");
          return handler.next(response);
        },
        onError: (error, handler) {
          print("ERROR: ${error.message}");
          return handler.next(error);
        },
      ),
    );
  }
}