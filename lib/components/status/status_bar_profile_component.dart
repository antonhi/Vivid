import 'package:flutter/material.dart';
import 'package:projectvivid/components/text/text_subtitle_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';

class StatusBarProfileComponent extends StatelessWidget {

  final double width;

  const StatusBarProfileComponent({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: (width-20)/3,
              child: TextSubtitleComponent(textColor: AppColorConfiguration.white, text: 'profile'),
            ),
            SizedBox(
              width: (width-20)/3
            ),
            SizedBox(
              width: (width-20)/3,
              child: Align(alignment: Alignment.centerRight, child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.add, color: AppColorConfiguration.accent, size: 35,),
                  SizedBox(width: 10,),
                  Icon(Icons.menu, color: AppColorConfiguration.white, size: 35,)
                ],
              )),
            ),
          ],
        )
    );
  }
}