import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/authentication/controllers/authentication_controller.dart';
import 'package:projectvivid/authentication/pages/authentication_register_page.dart';
import 'package:projectvivid/authentication/pages/authentication_sign_in_page.dart';
import 'package:projectvivid/authentication/states/authentication_state.dart';
import 'package:projectvivid/components/buttons/button_text_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';

class AuthenticationHomePage extends StatelessWidget {

  const AuthenticationHomePage({Key? key}) : super(key: key);
  static const String route = '/AuthenticationHomePage';

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
                text: 'Sign In',
                height: 50,
                buttonColor: AppColorConfiguration.accent,
                textColor: AppColorConfiguration.white,
                onTap: () { _navigateToSignInPage(context); },
              ),
              const SizedBox(height: 30,),
              ButtonTextComponent(
                text: 'Register',
                height: 50,
                buttonColor: AppColorConfiguration.white,
                textColor: AppColorConfiguration.dark,
                onTap: () { _navigateToRegisterPage(context); },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToSignInPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<AuthenticationController>(
        create: (context) => AuthenticationController(const AuthenticationState(null, false)),
        child: const AuthenticationSignInPage()
      );
    }));
  }

  void _navigateToRegisterPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<AuthenticationController>(
          create: (context) => AuthenticationController(const AuthenticationState(null, false)),
          child: const AuthenticationRegisterPage()
      );
    }));
  }
}
