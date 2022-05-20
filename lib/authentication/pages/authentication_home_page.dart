import 'package:flutter/material.dart';
import 'package:projectvivid/authentication/pages/authentication_register_page.dart';
import 'package:projectvivid/authentication/pages/authentication_sign_in_page.dart';
import 'package:projectvivid/components/buttons/button_text_component.dart';
import 'package:projectvivid/configuration/colors/background_color_configuration.dart';
import 'package:projectvivid/configuration/colors/button_color_configuration.dart';
import 'package:projectvivid/configuration/colors/text_color_configuration.dart';

class AuthenticationHomePage extends StatelessWidget {

  const AuthenticationHomePage({Key? key}) : super(key: key);
  static const String route = '/AuthenticationHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColorConfiguration.darkModePrimary,
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTextComponent(
                text: 'Sign In',
                height: 50,
                buttonColor: ButtonColorConfiguration.accent,
                textColor: Colors.white,
                onTap: () { _navigateToSignInPage(context); },
              ),
              const SizedBox(height: 30,),
              ButtonTextComponent(
                text: 'Register',
                height: 50,
                buttonColor: ButtonColorConfiguration.darkModePrimary,
                textColor: TextColorConfiguration.dark,
                onTap: () { _navigateToRegisterPage(context); },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToSignInPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const AuthenticationSignInPage()));
  }

  void _navigateToRegisterPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const AuthenticationRegisterPage()));
  }
}
