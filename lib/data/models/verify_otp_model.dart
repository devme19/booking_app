class VerifyOtpModel {
  String? message;
  String? token;
  int? userId;

  VerifyOtpModel({this.message, this.token, this.userId});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['token'] = token;
    data['user_id'] = userId;
    return data;
  }
}