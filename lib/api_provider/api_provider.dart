import 'package:get/get.dart';

class ApiProvider extends GetConnect{
  Future<Response> getOtpCode(String phoneNumber)async{
    Map<String,dynamic> body={'phone_number':phoneNumber,'is_business':'1'};
    final response = await post("http://192.168.43.111:8000/api/otp_auth/generate_otp",body);
    return response;
  }
}