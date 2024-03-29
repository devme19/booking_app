import 'package:booking_app/core/either.dart';
import 'package:booking_app/core/failures.dart';
import 'package:booking_app/core/use_case.dart';
import 'package:booking_app/data/models/profiles_model.dart';
import 'package:booking_app/domain/repository/app_repository.dart';

class GetProfilesUseCase implements UseCase<ProfilesModel,NoParams>{
  final AppRepository repository;

  GetProfilesUseCase({required this.repository});

  @override
  Future<Either<Failure, ProfilesModel>> call(NoParams params) {
    return repository.getProfiles();
  }
}