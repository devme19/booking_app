import 'package:booking_app/core/use_case.dart';
import 'package:booking_app/domain/use_cases/user/get_profiles_usecase.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController{
  late GetProfilesUseCase getProfileUseCase;
  RxInt selectedScreenIndex = 0.obs;
  getProfiles(){
    getProfileUseCase = Get.find();
    getProfileUseCase.call(NoParams()).then((response){
      if(response.isRight){
        if (response.right.profile!.isEmpty){

        }
      }
    });
  }
  selectScreen(int index) {
    selectedScreenIndex.value = index;
  }
}