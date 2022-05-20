import 'package:flutter/cupertino.dart';

import '../../configuration/sizes/text_size_configuration.dart';

class TextMediumComponent extends StatelessWidget {

  final Color textColor;
  final String text;

  const TextMediumComponent({Key? key, required this.textColor, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: TextSizeConfiguration.medium,
        fontWeight: FontWeight.normal, color: textColor, fontFamily: 'Lexend'));
  }
}
