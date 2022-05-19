import 'package:equatable/equatable.dart';

class AuthenticationSignInState extends Equatable {

  final String? _email, _password;

  AuthenticationSignInState(this._email, this._password);

  @override
  List<Object?> get props => [_email, _password];

}