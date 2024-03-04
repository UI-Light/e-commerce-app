import 'package:dio/dio.dart';

class ApiClient {
  ApiClient({required this.baseUrl});

  final String baseUrl;

  Dio get dio => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
        ),
      );
}
