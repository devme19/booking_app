import 'package:booking_app/core/either.dart';
import 'package:booking_app/core/failures.dart';
import 'package:booking_app/core/use_case.dart';
import 'package:booking_app/domain/repository/app_repository.dart';

class VerifyOtpUseCase implements UseCase<bool,Params>{
  final AppRepository repository;

  VerifyOtpUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) {
    return repository.verifyOtp(params.body!);
  }

}