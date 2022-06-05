import 'package:flutter/cupertino.dart';

import '../../configuration/sizes/text_size_configuration.dart';

class TextLargeBoldedComponent extends StatelessWidget {

  final String text;
  final Color textColor;

  const TextLargeBoldedComponent({Key? key, required this.text, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: TextSizeConfiguration.large,
        fontWeight: FontWeight.bold, color: textColor, fontFamily: 'Lexend'));
  }
}