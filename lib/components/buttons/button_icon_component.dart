import 'package:flutter/cupertino.dart';

class ButtonIconComponent extends StatelessWidget {

  final Color buttonColor;
  final Icon icon;
  final double height;
  final void Function() onTap;

  const ButtonIconComponent({Key? key,
    required this.buttonColor,
    required this.icon,
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
          child: icon,
        ),
      ),
    );
  }
}
