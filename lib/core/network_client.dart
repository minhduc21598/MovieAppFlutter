import 'package:dio/dio.dart';
import 'package:movie_world/constants/api_endpoint.dart';

class NetworkClient {
  static late Dio dio;

  static void createClient() {
    dio = Dio(BaseOptions(
        baseUrl: ApiEndpoint.baseUrl,
        connectTimeout: Duration(seconds: 30),
        sendTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        headers: {
          'accept': 'application/json',
        },
        queryParameters: {
          'api_key': ApiEndpoint.apiKey,
        }));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    ));
  }
}
