import 'package:booking_app/data/data_sources/local/local_data_source.dart';
import 'package:booking_app/data/data_sources/remote/client.dart';
import 'package:booking_app/data/data_sources/remote/remote_data_source.dart';
import 'package:booking_app/data/repository/app_repository_impl.dart';
import 'package:booking_app/domain/repository/app_repository.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<AppLocalDataSource>(AppLocalDateSourceImpl());
    Get.put<AppRemoteDataSource>(AppRemoteDataSourceImpl());
    Get.put<AppRepository>(AppRepositoryImpl(
      localDataSource: Get.find<AppLocalDataSource>(),
      remoteDataSource: Get.find<AppRemoteDataSource>()
    ));
  }
  
}