import 'package:flutter/material.dart';
import 'package:projectvivid/components/text/text_small_bolded_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';
import 'package:projectvivid/models/user_model.dart';

class ProfilePictureAndUsernameComponent extends StatelessWidget {

  final UserModel user;
  final double height;

  const ProfilePictureAndUsernameComponent({Key? key, required this.user, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(backgroundColor: AppColorConfiguration.white, maxRadius: height/2,),
        const SizedBox(height: 3,),
        const TextSmallBoldedComponent(textColor: AppColorConfiguration.secondary, text: 'User')
      ],
    );
  }
}
