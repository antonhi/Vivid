import 'package:bloc/bloc.dart';

import '../states/app_authentication_state.dart';
import '../states/app_state.dart';

class AppController extends Cubit<AppState> {

  AppController(AppState initialState) : super(initialState);

  void showAuthentication() {
    emit(AppAuthenticationState());
  }

}