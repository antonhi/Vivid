import 'package:bloc/bloc.dart';
import 'package:projectvivid/authentication/states/authentication_state.dart';

class AuthenticationController extends Cubit<AuthenticationState> {

  AuthenticationController(AuthenticationState initialState) : super(initialState);

  void update(String? error) {
    emit(AuthenticationState(error));
  }

}