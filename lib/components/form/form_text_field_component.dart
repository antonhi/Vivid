import 'package:flutter/material.dart';
import 'package:projectvivid/configuration/sizes/text_size_configuration.dart';

import '../../configuration/colors/app_color_configuration.dart';

class FormTextFieldComponent extends StatelessWidget {

  final Color lineColor;
  final String placeholder;
  final TextInputAction action;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String)? onSubmitted;

  const FormTextFieldComponent({Key? key,
    required this.lineColor,
    required this.placeholder,
    required this.action,
    required this.focusNode,
    required this.controller,
    this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      autofocus: true,
      focusNode: focusNode,
      textInputAction: action,
      style: const TextStyle(fontSize: TextSizeConfiguration.medium,
          color: AppColorConfiguration.white, fontFamily: 'Lexend'),
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lineColor)
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: lineColor)
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColorConfiguration.accent)
          ),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lineColor)
          ),
          hintText: placeholder,
          hintStyle: const TextStyle(fontSize: TextSizeConfiguration.medium,
              color: AppColorConfiguration.secondary, fontFamily: 'Lexend'),
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10)
      ),
    );
  }
}
