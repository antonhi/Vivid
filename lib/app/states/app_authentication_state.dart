import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/authentication/controllers/authentication_controller.dart';
import 'package:projectvivid/authentication/states/authentication_home_state.dart';
import 'package:projectvivid/authentication/states/authentication_state.dart';

import 'app_state.dart';

class AppAuthenticationState extends AppState {

  @override
  List<Object?> get props => [];

  @override
  Widget getPage(BuildContext context) {
    AuthenticationState authenticationState = AuthenticationHomeState();
    return BlocProvider<AuthenticationController>(
      create: (context) => AuthenticationController(authenticationState),
      child: authenticationState.getPage(context),
    );
    throw UnimplementedError();
  }

}