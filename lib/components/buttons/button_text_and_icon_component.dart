import 'package:flutter/cupertino.dart';
import 'package:projectvivid/components/text/text_button_component.dart';

class ButtonIconAndTextComponent extends StatelessWidget {

  final Color buttonColor, textColor;
  final String text;
  final Icon icon;
  final bool iconIsRight;
  final double height, textPadding = 10;
  final void Function() onTap;

  const ButtonIconAndTextComponent({Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    required this.height,
    required this.onTap,
    required this.icon,
    required this.iconIsRight}) : super(key: key);

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
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _getRow(),
        ),
      ),
    );
  }

  List<Widget> _getRow() {
    return iconIsRight ? [
      TextButtonComponent(
        text: text,
        fontSize: height-textPadding,
        textColor: textColor,
        textWeight: FontWeight.bold,),
      icon
    ] : [
      icon,
      TextButtonComponent(
        text: text,
        fontSize: height-textPadding,
        textColor: textColor,
        textWeight: FontWeight.bold,)
    ];
  }

}
