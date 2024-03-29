import 'package:booking_app/domain/use_cases/user/user_is_login_usecase.dart';
import 'package:booking_app/presentation/pages/splash_page/splash_page_controller.dart';
import 'package:get/get.dart';

class SplashPageBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<UserIsLoginUseCase>(() => UserIsLoginUseCase(repository: Get.find()));
    Get.lazyPut(() => SplashPageController());
  }

}