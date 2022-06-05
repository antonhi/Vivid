import 'package:flutter/cupertino.dart';

import '../../configuration/sizes/text_size_configuration.dart';

class TextSmallBoldedComponent extends StatelessWidget {

  final Color textColor;
  final String text;

  const TextSmallBoldedComponent({Key? key, required this.textColor, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: TextSizeConfiguration.small,
        fontWeight: FontWeight.bold, color: textColor, fontFamily: 'Lexend'));
  }
}