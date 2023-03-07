import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/authentication/controllers/authentication_controller.dart';
import 'package:projectvivid/authentication/states/authentication_state.dart';

class AuthenticationRoutesPage extends StatelessWidget {
  const AuthenticationRoutesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthenticationController, AuthenticationState>(
          builder: (context, state) {
            return state.getPage(context);
          }),
    );
  }
}
