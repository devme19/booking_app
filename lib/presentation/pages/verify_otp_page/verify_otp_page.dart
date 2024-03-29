import 'package:booking_app/presentation/pages/verify_otp_page/verify_otp_page_controller.dart';
import 'package:booking_app/presentation/widgets/key_pad_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpPage extends GetView<VerifyOtpPageController> {
  VerifyOtpPage({super.key}){
    final Map<String,dynamic> arguments = Get.arguments;
    controller.phoneNumber = arguments['phoneNumber'];
  }
  AppBar appBar = AppBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child:
              otpCodeWidget(),
            ),
            const SizedBox(height: 20.0,),
            Expanded(
                flex: 3,
                child: KeyPadWidget(onTap: controller.onTap,appBarHeight: appBar.preferredSize.height+40,))
          ],

        ),
      ),
    );
  }
  Widget otpCodeWidget(){
    return
     Obx(()=>
         Column(
           children: [
             // const SizedBox(height: 20.0,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("enter_otp_code".tr),
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
                       child: Center(child: Text(controller.otpCode.value)),
                     ),
                   ),
                 ],
               ),
             ),
             const SizedBox(height: 20.0,),
             Expanded(
               child: controller.wrongOtpCode.value?Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("wrong_otp_number".tr,style: const TextStyle(color: Colors.red),),
                 ],
               ):Container(
                 // color: Colors.green,
               ),
             ),
           ],
         ));
  }
}
