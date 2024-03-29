import 'package:booking_app/presentation/pages/splash_page/splash_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashPageController> {
  SplashPage({super.key}){
    controller.userIsAuthenticated();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
