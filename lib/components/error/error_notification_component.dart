import 'package:flutter/material.dart';
import 'package:projectvivid/components/text/text_small_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';

class ErrorNotificationComponent extends StatelessWidget {

  final String text;
  final double height;
  final double padding = 20;

  const ErrorNotificationComponent({Key? key,
    required this.text,
    required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColorConfiguration.tertiary
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.error, color: AppColorConfiguration.accent, size: height-padding,),
            const SizedBox(width: 10,),
            Expanded(flex: 2,child: TextSmallComponent(textColor: AppColorConfiguration.white, text: text))
          ],
        ),
      ),
    );
  }
}
