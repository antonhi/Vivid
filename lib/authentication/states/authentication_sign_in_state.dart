import 'package:flutter/src/widgets/framework.dart';
import 'package:projectvivid/authentication/states/authentication_state.dart';

class AuthenticationSignInState extends AuthenticationState {

  final String? _email, _password;

  AuthenticationSignInState(this._email, this._password);

  @override
  List<Object?> get props => [_email, _password];

  String? getEmail() { return _email; }
  String? getPassword() { return _password; }

  @override
  Widget getPage(BuildContext context) {
    // TODO: implement getPage
    throw UnimplementedError();
  }

}