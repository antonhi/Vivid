import 'package:projectvivid/authentication/states/authentication_state.dart';

class AuthenticationRegisterState extends AuthenticationState {

  final String? _email, _password, _username;

  AuthenticationRegisterState(this._email, this._password, this._username);

  @override
  List<Object?> get props => [_email, _password, _username];

  String? getEmail() { return _email; }
  String? getPassword() { return _password; }
  String? getUsername() { return _username; }

}