
import 'package:booking_app/core/either.dart';
import 'package:booking_app/core/failures.dart';
import 'package:booking_app/core/use_case.dart';
import 'package:booking_app/domain/repository/app_repository.dart';

class GetLanguageUseCase implements UseCase<bool,NoParams>{
  final AppRepository? repository;

  GetLanguageUseCase({this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository!.getLanguage();
  }
}