import 'package:booking_app/core/use_case.dart';
import 'package:booking_app/domain/use_cases/user/get_profiles_usecase.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController{
  late GetProfilesUseCase getProfilesUseCase;
  getProfiles(){
    getProfilesUseCase = Get.find();
    getProfilesUseCase.call(NoParams()).then((response) {
      if(response.isRight){

      }
    });
  }
}