import 'package:flutter/material.dart';
import 'package:projectvivid/components/text/text_large_component.dart';
import 'package:projectvivid/components/text/text_title_component.dart';
import 'package:projectvivid/configuration/colors/background_color_configuration.dart';
import 'package:projectvivid/configuration/colors/text_color_configuration.dart';

class AuthenticationSignInPage extends StatelessWidget {
  const AuthenticationSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double navigationWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: BackgroundColorConfiguration.darkModePrimary,
      body: Center(
        child: SizedBox(
          width: navigationWidth-40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextTitleComponent(textColor: TextColorConfiguration.white, text: 'Sign In'),
              const SizedBox(height: 5,),
              TextLargeComponent(text: 'It\'s Good To See You', textColor: TextColorConfiguration.secondary),

            ],
          ),
        ),
      ),
    );
  }
}
