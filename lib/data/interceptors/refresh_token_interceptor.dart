// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:booking_app/data/data_sources/local/local_data_source.dart';
import 'package:dio/dio.dart';

import '../data_sources/remote/client.dart';

class RefreshTokenInterceptor extends QueuedInterceptorsWrapper {
  String? token;
  AppLocalDataSource? localDataSource;
  RefreshTokenInterceptor({this.localDataSource});
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    token = localDataSource!.getToken();
    if (token != null && token != '') {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && token != null) {
      Dio tokenDio = Dio();
      tokenDio.options = Client().dio.options;
      try {
        Response response = await tokenDio.post("https://refresh.api",
            data: jsonEncode({"refresh_token": localDataSource!.getRefreshToken()}));
        if (response.statusCode == 200) {
          //get new tokens ...
          String token, refreshToken;
          token = response.data["token"];
          refreshToken = response.data["refreshToken"];
          localDataSource!.saveToken(token);
          localDataSource!.saveRefreshToken(refreshToken);

          //set bearer
          err.requestOptions.headers["Authorization"] = "Bearer " + token;
          //create request with new access token
          final opts = Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers);
          final cloneReq = await Client().dio.request(err.requestOptions.path,
              options: opts,
              data: err.requestOptions.data,
              queryParameters: err.requestOptions.queryParameters);

          return handler.resolve(cloneReq);
        }

        return Client().dio;
      } catch (e) {}
    }
    return handler.next(err);
  }
}