import 'package:get/get.dart';

class Messages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'enter_phone_number':'Please enter your phone number',
      'enter_otp_code':'Please enter otp code',
      'app_title':'Booking app',
      'wrong_number':'The phone number entered is incorrect',
      'wrong_otp_number':'The otp code entered is incorrect',
    },
    'fa_IR':{
      'enter_phone_number':'لطفا شماره همراه خود را وارد کنید',
      'app_title':'برنامه رزرو',
      'wrong_number':'شماره وارد شده اشتباه است',
      'enter_otp_code':'لطفا کد ارسال شده را وارد کنید',
      'wrong_otp_number':'کد وارد شده اشتباه است',
    }
  };

}