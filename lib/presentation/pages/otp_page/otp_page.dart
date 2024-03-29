import 'package:booking_app/presentation/pages/otp_page/otp_page_controller.dart';
import 'package:booking_app/presentation/widgets/key_pad_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpPage extends GetView<OtpPageController> {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child:
              phoneNumberWidget(),
            ),
            const SizedBox(height: 20.0,),
            Expanded(
                flex: 3,
                child: KeyPadWidget(onTap: controller.onTap,appBarHeight: 40,))
          ],

        ),
      ),
    );
  }
  Widget phoneNumberWidget(){
    return
      Obx(()=>
          Column(
            children: [
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("enter_phone_number".tr),
                ],
              ),

              const SizedBox(height: 20.0,),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Center(child: Text(controller.phoneNumber.value)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0,),
              Expanded(
                child: controller.wrongPhoneNumber.value?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("wrong_number".tr,style: const TextStyle(color: Colors.red),),
                  ],
                ):Container(
                  // color: Colors.green,
                ),
              ),
            ],
          ));
  }
}