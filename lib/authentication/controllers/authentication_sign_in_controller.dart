import 'package:bloc/bloc.dart';
import 'package:projectvivid/authentication/states/authentication_sign_in_state.dart';

class AuthenticationSignInController extends Cubit<AuthenticationSignInState> {

  String? _email, _password;

  AuthenticationSignInController(AuthenticationSignInState initialState) : super(initialState);

  void showSignInPage() {
    emit(AuthenticationSignInState(_email, _password));
  }

}