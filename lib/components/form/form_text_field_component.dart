import 'package:flutter/material.dart';
import 'package:projectvivid/configuration/colors/form_color_configuration.dart';
import 'package:projectvivid/configuration/colors/text_color_configuration.dart';
import 'package:projectvivid/configuration/sizes/text_size_configuration.dart';

class FormTextFieldComponent extends StatelessWidget {

  final Color lineColor;
  final String placeholder;
  final TextInputAction action;
  final TextEditingController controller;

  const FormTextFieldComponent({Key? key,
    required this.lineColor,
    required this.placeholder,
    required this.action,
    required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: action,
      style: const TextStyle(fontSize: TextSizeConfiguration.medium,
          color: TextColorConfiguration.white),
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: FormColorConfiguration.secondary)
          ),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: FormColorConfiguration.secondary)
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: FormColorConfiguration.accent)
          ),
          disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: FormColorConfiguration.secondary)
          ),
          hintText: placeholder,
          hintStyle: const TextStyle(fontSize: TextSizeConfiguration.medium, color: TextColorConfiguration.secondary),
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10)
      ),
    );
  }
}
