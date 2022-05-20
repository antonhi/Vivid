import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/authentication/controllers/authentication_controller.dart';
import 'package:projectvivid/authentication/states/authentication_home_state.dart';
import 'package:projectvivid/authentication/states/authentication_state.dart';
import 'package:projectvivid/components/buttons/button_text_component.dart';
import 'package:projectvivid/configuration/colors/background_color_configuration.dart';
import 'package:projectvivid/configuration/colors/button_color_configuration.dart';
import 'package:projectvivid/configuration/colors/text_color_configuration.dart';

class AuthenticationHomePage extends StatelessWidget {

  const AuthenticationHomePage({Key? key}) : super(key: key);
  static const String route = '/AuthenticationHomePage';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationController, AuthenticationState>(builder: (context, state) {
      if (state is AuthenticationHomeState) {
        return Scaffold(
          backgroundColor: BackgroundColorConfiguration.darkModePrimary,
          body: Center(
            child: SizedBox(
              width: 200,
              child: Column(
                children: [
                  ButtonTextComponent(
                    text: 'Sign In',
                    height: 50,
                    buttonColor: ButtonColorConfiguration.accent,
                    textColor: Colors.white,
                    onTap: () {},
                  ),
                  ButtonTextComponent(
                    text: 'Register',
                    height: 50,
                    buttonColor: ButtonColorConfiguration.darkModePrimary,
                    textColor: TextColorConfiguration.dark,
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        );
      } else { return Container(); }
    });
  }
}
