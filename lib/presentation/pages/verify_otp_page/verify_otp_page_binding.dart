import 'package:booking_app/domain/use_cases/user/verify_otp_usecase.dart';
import 'package:booking_app/presentation/pages/verify_otp_page/verify_otp_page_controller.dart';
import 'package:get/get.dart';

class VerifyOtpPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<VerifyOtpUseCase>(() => VerifyOtpUseCase(repository: Get.find()));
    Get.lazyPut(() => VerifyOtpPageController());
  }

}