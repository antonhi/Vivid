import 'package:flutter/material.dart';
import 'package:projectvivid/components/text/text_medium_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';

class FormAcknowledgeWidget extends StatelessWidget {

  final String text;
  final bool termsAndConditionsAcknowledged;
  final Function(bool?)? onChange;

  const FormAcknowledgeWidget({Key? key,
    required this.text,
    required this.termsAndConditionsAcknowledged,
    this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: termsAndConditionsAcknowledged,
            onChanged: onChange,
            fillColor: MaterialStateProperty.resolveWith(getColor)
        ),
        const SizedBox(width: 10,),
        Expanded(
            child: TextMediumComponent(textColor: AppColorConfiguration.secondary, text: text)
        )
      ],
    );
  }

  Color getColor(Set<MaterialState> states) {
    return AppColorConfiguration.tertiary;
  }
}
