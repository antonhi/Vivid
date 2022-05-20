import 'package:flutter/cupertino.dart';
import 'package:projectvivid/configuration/sizes/text_size_configuration.dart';

class TextTitleComponent extends StatelessWidget {

  final Color textColor;
  final String text;

  const TextTitleComponent({Key? key, required this.textColor, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: TextSizeConfiguration.title,
        fontWeight: FontWeight.bold, color: textColor, fontFamily: 'Lexend'));
  }
}
