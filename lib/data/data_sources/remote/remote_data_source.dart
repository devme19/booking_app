import 'package:booking_app/core/exception.dart';
import 'package:booking_app/data/data_sources/remote/client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


abstract class AppRemoteDataSource {
  Future<Response> get({String url, Map<String, dynamic> queryParameters});
  Future<Response> post({String url, Map<String, dynamic> body});
  Future<bool> delete({String url});
  Future<bool> requestMultiPart(
      {String url, FormData formData, ValueChanged<double> uploadedAmount});
}

class AppRemoteDataSourceImpl implements AppRemoteDataSource {
  @override
  Future<bool> delete({String? url}) async {
    try {
      Response response = await Client().dio.delete(url!);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NetworkException(
            message: e.message);
      } else {
        throw ServerException(
            errorCode: e.response!.statusCode,
            errorMessage: e.response!.statusMessage);
      }
    }
  }

  @override
  Future<Response> get(
      {String? url, Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await Client().dio.get(url!, queryParameters: queryParameters??{});
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw NetworkException(
            message: e.message);
      } else {
        throw ServerException(
            errorCode: e.response!.statusCode,
            errorMessage: e.response!.statusMessage);
      }
    }catch(e){
      print("errrrri:"+e.toString());
      throw NetworkException(
          message: e.toString());
    }
  }

  @override
  Future<Response> post({String? url, Map<String, dynamic>? body}) async {
    try {
      Response response = await Client().dio.post(url!, data: body!);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NetworkException(
            message: e.message);
      } else {
        throw ServerException(
            errorCode: e.response!.statusCode,
            errorMessage: e.response!.statusMessage);
      }
    }
  }

  @override
  Future<bool> requestMultiPart(
      {String? url,
        FormData? formData,
        ValueChanged<double>? uploadedAmount}) async {
    try {
      Response response = await Client().dio.post(url!, data: formData!,
          onSendProgress: (int sent, int total) {
            uploadedAmount!(sent / total);
            print("uploaded : ${sent / total}");
          });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NetworkException(
            message: e.message);
      } else {
        throw ServerException(
            errorCode: e.response!.statusCode,
            errorMessage: e.response!.statusMessage);
      }
    }
  }
}