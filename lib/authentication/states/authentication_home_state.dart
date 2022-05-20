import 'package:flutter/src/widgets/framework.dart';
import 'package:projectvivid/authentication/pages/authentication_home_page.dart';
import 'package:projectvivid/authentication/states/authentication_state.dart';

class AuthenticationHomeState extends AuthenticationState {

  @override
  List<Object?> get props => [];

  @override
  Widget getPage(BuildContext context) {
    return const AuthenticationHomePage();
  }

}