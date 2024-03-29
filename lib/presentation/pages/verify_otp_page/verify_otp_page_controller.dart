import 'package:booking_app/core/use_case.dart';
import 'package:booking_app/domain/use_cases/user/verify_otp_usecase.dart';
import 'package:booking_app/presentation/routes/app_routes.dart';
import 'package:get/get.dart';

class VerifyOtpPageController extends GetxController{
  RxString otpCode="".obs;
  RxBool wrongOtpCode = false.obs;
  late VerifyOtpUseCase verifyOtpUseCase;
  String phoneNumber = "";
  verifyOtp(){
    verifyOtpUseCase = Get.find();
    Map<String,dynamic> body = {
      'phone_number':phoneNumber,
      'otp_code':otpCode.value
    };
    verifyOtpUseCase.call(Params(body: body)).then((response) {
      if(response.isRight){
        Get.toNamed(AppRoutes.homePage);
      }else{

      }
    });
  }
  onTap(String value){
    if(value == "back"){
      if(otpCode.isNotEmpty) {
        otpCode.value = otpCode.value.substring(0,otpCode.value.length-1);
        wrongOtpCode.value = false;
      }
    }else{
      if(value == "done"){
        if(otpCode.value.length == 6){
          verifyOtp();
        }else{
          wrongOtpCode.value = true;
        }
      }
      else
      if (otpCode.value.length <6) {
        otpCode.value+=value;
        wrongOtpCode.value = false;
      }
    }
  }
}