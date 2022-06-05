import 'package:bloc/bloc.dart';
import 'package:projectvivid/app/states/app_feed_state.dart';
import 'package:projectvivid/app/states/app_inbox_state.dart';
import 'package:projectvivid/app/states/app_profile_state.dart';

import '../states/app_authentication_state.dart';
import '../states/app_state.dart';

class AppController extends Cubit<AppState> {

  AppController(AppState initialState) : super(initialState);

  void showAuthentication() {
    emit(AppAuthenticationState());
  }

  void showFeed() {
    emit(AppFeedState());
  }

  void showProfile() {
    emit(AppProfileState());
  }

  void showInbox() {
    emit(AppInboxState());
  }



}