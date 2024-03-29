import 'package:booking_app/core/config.dart';
import 'package:booking_app/core/either.dart';
import 'package:booking_app/core/exception.dart';
import 'package:booking_app/core/failures.dart';
import 'package:booking_app/data/data_sources/local/local_data_source.dart';
import 'package:booking_app/data/data_sources/remote/remote_data_source.dart';
import 'package:booking_app/data/models/otp_model.dart';
import 'package:booking_app/data/models/profiles_model.dart';
import 'package:booking_app/data/models/verify_otp_model.dart';
import 'package:booking_app/domain/repository/app_repository.dart';
import 'package:dio/dio.dart';

class AppRepositoryImpl implements AppRepository {
  final AppLocalDataSource? localDataSource;
  final AppRemoteDataSource? remoteDataSource;

  AppRepositoryImpl({this.localDataSource, this.remoteDataSource});

  @override
  Future<Either<Failure, bool>> login(Map<String, dynamic> body) async {
    try {
      Response response = await remoteDataSource!.post(url: "user/login", body: body);
      if(response.statusCode == 200) {
        return Right(true);
      }
      return Right(false);
      // bool response = await localDataSource!.login(body['userName'],body['passWord']);
    } on ServerException catch (e) {
      return Left(
          ServerFailure(errorCode: e.errorCode, errorMessage: e.errorMessage));
    }
  }


  @override
  Future<Either<Failure, bool>> setThemeMode(bool isDark) async{
    try{
      bool response = localDataSource!.setThemeMode(isDark);
      return Right(response);
    }on CacheException catch(e){
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> getThemeMode() async{
    try{
      bool response = localDataSource!.getThemeMode();
      return Right(response);
    }on CacheException catch(e){
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> getLanguage() async{
    try{
      bool response = localDataSource!.getLanguage();
      return Right(response);
    }on CacheException catch(e){
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> setLanguage(bool isEn) async{
    try{
      bool response = localDataSource!.setLanguage(isEn);
      return Right(response);
    }on CacheException catch(e){
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> userIsLogin() async{
    try{
      bool response = localDataSource!.userIsLogin();
      if(response){
        final res = await getProfiles();
        if(res.isRight){
          return Right(true);
        }
        else{
          return Right(false);
        }
      }
      return Right(response);
    }on CacheException catch(e){
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OtpModel>> getOtpCode(String phoneNumber) async{
    try{
      final response = await remoteDataSource!.post(url: "${baseUrl}otp_auth/generate_otp",body: {
        'phone_number':phoneNumber,
        'is_business':'1'
      });
      OtpModel otpModel = OtpModel.fromJson(response.data);
      return Right(otpModel);
    }on ServerException catch (e) {
      return Left(
          ServerFailure(errorCode: e.errorCode, errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyOtp(Map<String, dynamic> body) async{
    try{
      final response = await remoteDataSource!.post(
        url: "${baseUrl}otp_auth/verify_otp",
        body: body
      );
      VerifyOtpModel verifyOtpModel = VerifyOtpModel.fromJson(response.data);
      localDataSource!.saveToken(verifyOtpModel.token!);
      return Right(true);
    }on ServerException catch(e){
      return Left(
        ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage)
      );
    }
  }

  @override
  Future<Either<Failure, ProfilesModel>> getProfiles() async{
    try{
      final response = await remoteDataSource!.get(
          url: "${baseUrl}business/get_profiles"
      );
      ProfilesModel profilesModel = ProfilesModel.fromJson(response.data);
      return Right(profilesModel);
    }on ServerException catch(e){
      return Left(
          ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage)
      );
    }
  }
}
