
import 'package:booking_app/core/either.dart';
import 'package:booking_app/core/failures.dart';
import 'package:booking_app/core/use_case.dart';
import 'package:booking_app/domain/repository/app_repository.dart';

class LoginUseCase implements UseCase<bool, Params> {
  final AppRepository repository;

  LoginUseCase({required this.repository});
  @override
  Future<Either<Failure, bool>> call(Params params) {
    return repository.login(params.body!);
  }
}
