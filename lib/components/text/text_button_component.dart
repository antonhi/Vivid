import 'package:flutter/cupertino.dart';

class TextButtonComponent extends StatelessWidget {

  final String text;
  final double fontSize;
  final Color textColor;

  const TextButtonComponent({Key? key,
    required this.text,
    required this.fontSize,
    required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: fontSize,
        fontWeight: FontWeight.bold, color: textColor, fontFamily: 'Lexend'));
  }
}
