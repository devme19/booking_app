import 'package:booking_app/core/either.dart';
import 'package:booking_app/core/failures.dart';
import 'package:booking_app/core/use_case.dart';
import 'package:booking_app/data/models/otp_model.dart';
import 'package:booking_app/domain/repository/app_repository.dart';

class GetOtpCodeUseCase implements UseCase<OtpModel,Params>{
  final AppRepository repository;

  GetOtpCodeUseCase({required this.repository});

  @override
  Future<Either<Failure, OtpModel>> call(Params params) {
    return repository.getOtpCode(params.value!);
  }
}