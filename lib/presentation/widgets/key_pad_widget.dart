import 'package:booking_app/presentation/widgets/phone_button_widget.dart';
import 'package:flutter/material.dart';
class KeyPadWidget extends StatelessWidget {
  KeyPadWidget({super.key,required this.onTap,this.appBarHeight=0});
  Function onTap;
  double appBarHeight;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height-appBarHeight;
    double aspectRatio = width/(height/2);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          childAspectRatio: aspectRatio,
          mainAxisSpacing: 10.0, // Spacing between rows
          crossAxisSpacing: 10.0, // Spacing between columns
        ),

        itemCount: 12, // Number of items in the grid
        itemBuilder: (context, index) {
          // Replace with your item builder
          if(index < 9){
            return PhoneButtonWidget(
                title: (index+1).toString(),
                value: (index+1).toString(),
                onTap: onTap);
          }
          else{
            if (index == 9){
              return PhoneButtonWidget(
                  icon: const Icon(Icons.done_outline_rounded,color: Colors.green,),
                  value: "done",
                  onTap: onTap);
            }
            else if(index == 10){
              return PhoneButtonWidget(
                  title: "0",
                  value: "0",
                  onTap: onTap);
            }
            else if(index == 11){
              return PhoneButtonWidget(
                  icon: const Icon(Icons.backspace_rounded),
                  value: "back",
                  onTap: onTap);
            }
          }
        },
        physics: const NeverScrollableScrollPhysics(), // Disables scrolling
        shrinkWrap: true, // Fits the GridView to its children
      ),
    );
  }
}
