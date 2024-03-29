import 'package:booking_app/api_provider/api_provider.dart';
import 'package:booking_app/core/use_case.dart';
import 'package:booking_app/domain/use_cases/user/get_otp_code_usecase.dart';
import 'package:booking_app/presentation/routes/app_routes.dart';
import 'package:get/get.dart';

class OtpPageController extends GetxController {

  RxString phoneNumber = ''.obs;
  RxBool wrongPhoneNumber = false.obs;
  late GetOtpCodeUseCase getOtpCodeUseCase;

  onTap(String value){
    if(value == "back"){
      if(phoneNumber.value.isNotEmpty) {
        phoneNumber.value = phoneNumber.value.substring(0,phoneNumber.value.length-1);
        wrongPhoneNumber.value = false;
      }
    }else{
      if(value == "done"){
        if(phoneNumber.value.length == 11 && phoneNumber.value[0] == "0"){
          getOtpCodeUseCase = Get.find();
          getOtpCodeUseCase.call(Params(value: phoneNumber.value)).then((response) {
            if(response.isRight){
              Get.toNamed(AppRoutes.verifyOtpPage,arguments: {'phoneNumber':phoneNumber.value});
            }else{

            }
          });

        }else{
          wrongPhoneNumber.value = true;
        }
      }
      else
      if (phoneNumber.value.length <11) {
        phoneNumber.value+=value;
        wrongPhoneNumber.value = false;
      }
    }
  }
  getOtpCode()async{
    final res = await ApiProvider().getOtpCode("09905995748");
    print(res);
  }
}