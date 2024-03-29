import 'package:booking_app/core/config.dart';
import 'package:booking_app/data/data_sources/local/local_data_source.dart';
import 'package:booking_app/data/interceptors/refresh_token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class Client extends AppLocalDateSourceImpl{
  static final Client _client = Client._internal();
  factory Client() {
    return _client;
  }
  Client._internal();
  Dio dio = Dio();
  init() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.headers['content-Type'] = 'application/json';
    String token = getToken();
    if(token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    _initializeInterceptors();
  }

  _initializeInterceptors() {
    dio.interceptors.add(RefreshTokenInterceptor());
    // dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    //     String token = box!.read("authToken");
    //     if (token != null) options.headers['token'] = '$token';
    //     return handler.next(options);
    //   },
    // ));
    // dio.interceptors.add(RefreshTokenInterceptor());
    // dio.interceptors.add(RetryOnConnectionChangeInterceptor(
    //     requestRetrier: DioConnectivityRequestRetrier(
    //         connectivity: Connectivity(),
    //         dio: dio
    //     )
    // ));
  }
}
