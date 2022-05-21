import 'package:flutter/cupertino.dart';

import '../../configuration/sizes/text_size_configuration.dart';

class TextSmallComponent extends StatelessWidget {

  final Color textColor;
  final String text;

  const TextSmallComponent({Key? key, required this.textColor, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: TextSizeConfiguration.small,
        fontWeight: FontWeight.normal, color: textColor, fontFamily: 'Lexend'));
  }
}
