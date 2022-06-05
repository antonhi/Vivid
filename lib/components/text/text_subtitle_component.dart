import 'package:flutter/cupertino.dart';

import '../../configuration/sizes/text_size_configuration.dart';

class TextSubtitleComponent extends StatelessWidget {

  final Color textColor;
  final String text;

  const TextSubtitleComponent({Key? key, required this.textColor, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: TextSizeConfiguration.subtitle,
        fontWeight: FontWeight.bold, color: textColor, fontFamily: 'Lexend'));
  }
}