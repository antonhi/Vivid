import 'package:flutter/material.dart';
import 'package:projectvivid/components/text/text_small_bolded_component.dart';
import 'package:projectvivid/components/text/text_small_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';

class StatusBarComponent extends StatelessWidget {

  final double width;

  const StatusBarComponent({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: (width-20)/3,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              const TextSmallBoldedComponent(textColor: AppColorConfiguration.white, text: 'Good Evening'),
              TextSmallComponent(textColor: AppColorConfiguration.secondary, text: 'anton')
            ],),
          ),
          SizedBox(
            width: (width-20)/3,
            child: GestureDetector(child: const Image(image: AssetImage('images/vividlogo.png'), width: 50, height: 50,),
              onTap: () => {}),
          ),
          SizedBox(
            width: (width-20)/3,
            child: Align(alignment: Alignment.centerRight,child: CircleAvatar(backgroundColor: AppColorConfiguration.white,)),
          ),
        ],
      )
    );
  }
}
