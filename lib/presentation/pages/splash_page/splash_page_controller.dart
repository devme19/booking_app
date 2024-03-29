import 'package:booking_app/core/use_case.dart';
import 'package:booking_app/domain/use_cases/user/user_is_authenticated_usecase.dart';
import 'package:booking_app/presentation/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController{
  late UserIsAuthenticatedUseCase userIsAuthenticatedUseCase;

  userIsAuthenticated(){
    userIsAuthenticatedUseCase = Get.find();
    userIsAuthenticatedUseCase.call(NoParams()).then((response) {
      if(response.isRight){
        Get.toNamed(AppRoutes.homePage);
        // if(response.right.profile!.isEmpty){
        //   Get.toNamed(AppRoutes.profilePage);
        // }
        // else{
        //   Get.toNamed(AppRoutes.homePage);
        // }
      }
      else{
        Get.toNamed(AppRoutes.otpPage);
      }
    });
  }
}