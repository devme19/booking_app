class OtpModel {
  String? message;
  String? otpCode;

  OtpModel({this.message, this.otpCode});

  OtpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    otpCode = json['otp_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['otp_code'] = otpCode;
    return data;
  }
}