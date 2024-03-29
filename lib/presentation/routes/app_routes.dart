import 'package:booking_app/data/models/profiles_model.dart';
import 'package:booking_app/presentation/pages/home_page/home_page.dart';
import 'package:booking_app/presentation/pages/home_page/home_page_binding.dart';
import 'package:booking_app/presentation/pages/otp_page/otp_page.dart';
import 'package:booking_app/presentation/pages/otp_page/otp_page_binding.dart';
import 'package:booking_app/presentation/pages/profile_page/profile_page.dart';
import 'package:booking_app/presentation/pages/splash_page/splash_page.dart';
import 'package:booking_app/presentation/pages/splash_page/splash_page_binding.dart';
import 'package:booking_app/presentation/pages/verify_otp_page/verify_otp_page.dart';
import 'package:booking_app/presentation/pages/verify_otp_page/verify_otp_page_binding.dart';
import 'package:get/get.dart';

class AppRoutes{
  static const String otpPage="/otpPage";
  static const String verifyOtpPage="/verifyOtpPage";
  static const String homePage="/homePage";
  static const String splashPage="/splashPage";
  static const String profilePage="/profilePage";
}

class App {
  static Duration transitionDuration = const Duration(milliseconds: 500);
  static final pages=[
    GetPage(
        name: AppRoutes.otpPage,
        page: ()=> const OtpPage(),
      binding: OtpPageBinding()
    ),
    GetPage(
      name: AppRoutes.verifyOtpPage,
      page: ()=> VerifyOtpPage(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration ,
      binding: VerifyOtpPageBinding()
    ),
    GetPage(
        name: AppRoutes.splashPage,
        page: ()=> SplashPage(),
      binding: SplashPageBinding()
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: ()=>  HomePage(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
      binding: HomePageBinding()
    ),
    GetPage(
        name: AppRoutes.profilePage,
        page: ()=> const ProfilePage(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration:transitionDuration,

    )
  ];
}