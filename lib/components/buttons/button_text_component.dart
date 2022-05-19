import 'package:flutter/cupertino.dart';
import 'package:projectvivid/components/text/text_button_component.dart';

class ButtonTextComponent extends StatelessWidget {

  final Color buttonColor, textColor;
  final String text;
  final double height, textPadding = 10;
  final void Function() onTap;

  const ButtonTextComponent({Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    required this.height,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(height/2)
        ),
        child: Align(
          alignment: Alignment.center,
          child: TextButtonComponent(
            text: text,
            fontSize: height-textPadding,
            textColor: textColor
          ),
        ),
      ),
    );
  }
}
