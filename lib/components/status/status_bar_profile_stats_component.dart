import 'package:flutter/material.dart';
import 'package:projectvivid/components/text/text_large_component.dart';
import 'package:projectvivid/components/text/text_medium_component.dart';
import 'package:projectvivid/components/text/text_subtitle_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';

class StatusBarProfileStatsComponent extends StatelessWidget {

  final double width;

  const StatusBarProfileStatsComponent({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: (width-20)/3,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    TextMediumComponent(text: 'Views', textColor: AppColorConfiguration.accent),
                    TextMediumComponent(textColor: AppColorConfiguration.white, text: '2.3k')
                  ],
                ),
              ),
            ),
            SizedBox(
                width: (width-20)/3,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    TextMediumComponent(text: 'Followers', textColor: AppColorConfiguration.accent),
                    TextMediumComponent(textColor: AppColorConfiguration.white, text: '134')
                  ],
                ),
              ),
            ),
            SizedBox(
              width: (width-20)/3,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    TextMediumComponent(text: 'Likes', textColor: AppColorConfiguration.accent),
                    TextMediumComponent(textColor: AppColorConfiguration.white, text: '389')
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}