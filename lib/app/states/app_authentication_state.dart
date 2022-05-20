import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/authentication/controllers/authentication_controller.dart';
import 'package:projectvivid/authentication/pages/authentication_home_page.dart';
import 'package:projectvivid/authentication/states/authentication_state.dart';

import 'app_state.dart';

class AppAuthenticationState extends AppState {

  @override
  List<Object?> get props => [];

  @override
  Widget getPage(BuildContext context) {
    return BlocProvider<AuthenticationController>(
      create: (context) => AuthenticationController(AuthenticationState()),
      child: const AuthenticationHomePage(),
    );
    throw UnimplementedError();
  }

}