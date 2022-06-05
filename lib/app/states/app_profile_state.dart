import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/profile/controllers/profile_controller.dart';
import 'package:projectvivid/profile/pages/profile_page.dart';
import 'package:projectvivid/profile/states/profile_state.dart';

import 'app_state.dart';

class AppProfileState extends AppState {

  @override
  List<Object?> get props => [];

  @override
  Widget getPage(BuildContext context) {
    return BlocProvider<ProfileController>(
      create: (context) => ProfileController(ProfileState()),
      child: const ProfilePage(),
    );
  }

}