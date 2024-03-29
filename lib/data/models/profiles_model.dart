import 'package:booking_app/data/models/profile_model.dart';

class ProfilesModel {
  List<ProfileModel>? profile;

  ProfilesModel({this.profile});

  ProfilesModel.fromJson(Map<String, dynamic> json) {
    if (json['profile'] != null) {
      profile = <ProfileModel>[];
      json['profile'].forEach((v) {
        profile!.add(ProfileModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profile != null) {
      data['profile'] = profile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}