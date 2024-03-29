import 'package:booking_app/core/use_case.dart';
import 'package:booking_app/domain/use_cases/user/user_is_login_usecase.dart';
import 'package:booking_app/presentation/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController{
  late UserIsLoginUseCase userIsLoginUseCase;

  userIsLogin(){
    userIsLoginUseCase = Get.find();
    userIsLoginUseCase.call(NoParams()).then((response) {
      if(response.isRight){
        if(response.right){
          Get.toNamed(AppRoutes.homePage);
        }
        else{
          Get.toNamed(AppRoutes.otpPage);
        }
      }
      else{
        Get.toNamed(AppRoutes.otpPage);
      }
    });
  }
}