import 'package:booking_app/presentation/pages/home_page/home_page_controller.dart';
import 'package:booking_app/presentation/pages/notification_page/notification_page.dart';
import 'package:booking_app/presentation/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({super.key});

  final List<Map<String, dynamic>> _screens = [
    {'screen': const ProfilePage(), 'title': 'Profile'},
    {'screen': const NotificationPage(), 'title': 'Notifications'},
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Scaffold(body:_screens[controller.selectedScreenIndex.value]['screen'],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedScreenIndex.value,
            onTap: controller.selectScreen,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
              BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Notifications'),
            ],
          ),));
  }
}
