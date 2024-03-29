
import 'package:booking_app/core/either.dart';
import 'package:booking_app/core/failures.dart';
import 'package:booking_app/data/models/otp_model.dart';
import 'package:booking_app/data/models/profiles_model.dart';

abstract class AppRepository {
  ////////////////////// USER ///////////////////////////
  Future<Either<Failure, bool>> login(Map<String, dynamic> body);
  Future<Either<Failure, ProfilesModel>> userIsAuthenticated();
  Future<Either<Failure, OtpModel>> getOtpCode(String phoneNumber);
  Future<Either<Failure, bool>> verifyOtp(Map<String,dynamic> body);
  Future<Either<Failure, ProfilesModel>> getProfiles();
  ///////////////////// SETTING /////////////////////////
  Future<Either<Failure, bool>> setThemeMode(bool isDark);
  Future<Either<Failure, bool>> getThemeMode();
  Future<Either<Failure, bool>> setLanguage(bool isEn);
  Future<Either<Failure, bool>> getLanguage();
}
