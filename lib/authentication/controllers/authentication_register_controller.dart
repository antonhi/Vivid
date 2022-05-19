import 'package:bloc/bloc.dart';
import 'package:projectvivid/authentication/states/authentication_register_state.dart';

class AuthenticationRegisterController extends Cubit<AuthenticationRegisterState> {

  String? _email, _password, _username;

  AuthenticationRegisterController(AuthenticationRegisterState initialState) : super(initialState);

  void showRegisterPage() {
    emit(AuthenticationRegisterState(_email, _password, _username));
  }

}