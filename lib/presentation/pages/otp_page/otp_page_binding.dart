import 'package:booking_app/domain/use_cases/user/get_otp_code_usecase.dart';
import 'package:booking_app/presentation/pages/otp_page/otp_page_controller.dart';
import 'package:get/get.dart';

class OtpPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<GetOtpCodeUseCase>(()=>GetOtpCodeUseCase(repository: Get.find()));
    Get.lazyPut(() => OtpPageController());
  }

}