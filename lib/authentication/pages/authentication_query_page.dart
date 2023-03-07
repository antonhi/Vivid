import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/controllers/app_controller.dart';
import '../../components/buttons/button_text_component.dart';
import '../../configuration/colors/app_color_configuration.dart';

class AuthenticationQueryPage extends StatelessWidget {
  const AuthenticationQueryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConfiguration.dark,
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTextComponent(
                text: 'Profile',
                height: 50,
                buttonColor: AppColorConfiguration.accent,
                textColor: AppColorConfiguration.white,
                onTap: () { BlocProvider.of<AppController>(context).showProfile(); },
              ),
              const SizedBox(height: 30,),
              ButtonTextComponent(
                text: 'Feed',
                height: 50,
                buttonColor: AppColorConfiguration.white,
                textColor: AppColorConfiguration.dark,
                onTap: () { BlocProvider.of<AppController>(context).showFeed(); },
              ),
              const SizedBox(height: 30,),
              ButtonTextComponent(
                text: 'Inbox',
                height: 50,
                buttonColor: AppColorConfiguration.white,
                textColor: AppColorConfiguration.dark,
                onTap: () { BlocProvider.of<AppController>(context).showInbox(); },
              )
            ],
          ),
        ),
      ),
    );
  }
}
