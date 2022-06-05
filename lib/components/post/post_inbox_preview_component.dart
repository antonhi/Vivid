import 'package:flutter/material.dart';
import 'package:projectvivid/components/text/text_small_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';

import '../text/text_small_bolded_component.dart';

class PostInboxPreviewComponent extends StatelessWidget {
  const PostInboxPreviewComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(backgroundColor: AppColorConfiguration.white, maxRadius: 25,),
        const SizedBox(width: 10,),
        Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextSmallBoldedComponent(textColor: AppColorConfiguration.accent, text: 'anton'),
                TextSmallComponent(textColor: AppColorConfiguration.secondary,
                    text: 'hello sir this is a test of the inbox message system hopefully this is working')
              ],
            )
        )
      ],
    );
  }
}
