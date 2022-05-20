import 'package:flutter/material.dart';
import 'package:projectvivid/app/controllers/app_controller.dart';
import 'package:projectvivid/app/pages/app_routes_page.dart';
import 'package:projectvivid/app/states/app_authentication_state.dart';
import 'package:projectvivid/authentication/pages/authentication_home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppController>(
        create: (context) => AppController(AppAuthenticationState()),
        child: const AppRoutesPage(),
      ),
      routes: {
        AuthenticationHomePage.route: (context) => const AuthenticationHomePage()
      },
    );
  }
}
