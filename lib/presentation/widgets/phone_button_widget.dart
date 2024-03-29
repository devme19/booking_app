import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneButtonWidget extends StatelessWidget {
  PhoneButtonWidget({
    super.key,
    this.title,
    this.value,
    required this.onTap,
    this.icon

  });
  String? title,value;
  Icon? icon;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(50),
          side:BorderSide(color: Colors.grey.shade200,style: BorderStyle.solid)
      ),
      // shape: CircleBorder(
      //     side: BorderSide(color: Colors.grey.shade200,style: BorderStyle.solid),
      // ),
      child: SizedBox(
        // width: Get.width/4,
        // height: Get.width/4,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: Colors.grey.shade200,
          // borderRadius: BorderRadius.circular(180.0),
          onTap: (){
            onTap(value);
          },
          child: Center(
              child:icon!=null? Directionality(
                textDirection: TextDirection.ltr,
                child: icon!,
              ): Text(value!,)
          ),
        ),
      ),
    );
  }
}
