import 'package:flutter/cupertino.dart';

import '../text/text_button_component.dart';

class ButtonIconAndTextVerticalComponent extends StatelessWidget {

  final Color buttonColor, textColor;
  final String text;
  final Icon icon;
  final bool iconIsAbove;
  final double height;
  final void Function() onTap;

  const ButtonIconAndTextVerticalComponent({Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    required this.height,
    required this.onTap,
    required this.icon,
    required this.iconIsAbove}) : super(key: key);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _getColumn(),
        ),
      ),
    );
  }

  List<Widget> _getColumn() {
    return !iconIsAbove ? [
      TextButtonComponent(
          text: text,
          fontSize: height-height/1.5,
          textColor: textColor),
      icon
    ] : [
      icon,
      TextButtonComponent(
          text: text,
          fontSize: height-height/1.5,
          textColor: textColor)
    ];
  }

}