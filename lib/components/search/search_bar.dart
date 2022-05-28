import 'package:flutter/material.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';

import '../../configuration/sizes/text_size_configuration.dart';

class SearchBarComponent extends StatelessWidget {

  final TextEditingController controller;
  final Color backgroundColor;
  final String placeholder;
  final double height;
  final Function() onTap;
  final Function(String) onSubmit, onChanged;

  const SearchBarComponent({Key? key,
    required this.controller,
    required this.placeholder,
    required this.height,
    required this.onTap,
    required this.onSubmit,
    required this.onChanged,
    required this.backgroundColor,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      textInputAction: TextInputAction.search,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        border: OutlineInputBorder(borderSide: BorderSide(color: backgroundColor), borderRadius: BorderRadius.circular(50)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: backgroundColor), borderRadius: BorderRadius.circular(50)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: backgroundColor), borderRadius: BorderRadius.circular(50)),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: backgroundColor), borderRadius: BorderRadius.circular(50)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: backgroundColor), borderRadius: BorderRadius.circular(50)),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: backgroundColor), borderRadius: BorderRadius.circular(50)),
        hintMaxLines: 1,
        hintText: placeholder,
        hintStyle: const TextStyle(color: AppColorConfiguration.secondary, fontSize: TextSizeConfiguration.medium,
        fontFamily: 'Lexend'),
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      ),
      onTap: onTap,
      onSubmitted: (String submitted) => onSubmit(submitted),
      onChanged: (String submitted) => onChanged(submitted),
    );
  }
}