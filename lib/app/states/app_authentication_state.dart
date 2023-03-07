import 'package:flutter/src/widgets/framework.dart';
import 'package:projectvivid/authentication/pages/authentication_home_page.dart';
import 'package:projectvivid/authentication/pages/authentication_sign_in_page.dart';

import 'app_state.dart';

class AppAuthenticationState extends AppState {

  @override
  List<Object?> get props => [];

  @override
  Widget getPage(BuildContext context) {
    return const AuthenticationHomePage();
  }

}