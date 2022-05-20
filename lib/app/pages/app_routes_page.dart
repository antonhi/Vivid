import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/app/controllers/app_controller.dart';

import '../states/app_state.dart';

class AppRoutesPage extends StatelessWidget {
  const AppRoutesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppController, AppState>(
          builder: (context, state) {
            return state.getPage(context);
          }),
    );
  }
}
