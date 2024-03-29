import 'package:booking_app/data/data_sources/remote/client.dart';
import 'package:booking_app/presentation/pages/main_binding.dart';
import 'package:booking_app/presentation/routes/app_routes.dart';
import 'package:booking_app/presentation/translations/translations.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  bool kReleaseMode = false;
  await GetStorage.init();
  Client().init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        title: 'app_title'.tr,
        translations: Messages(),
        initialBinding: MainBinding(),
        getPages: App.pages,
        locale: const Locale('fa', 'IR'),
        fallbackLocale: const Locale('fa', 'IR'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.splashPage,
      ),
    );
  }
}