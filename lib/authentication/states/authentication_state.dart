import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {

  final String? _error;

  const AuthenticationState(this._error);

  @override
  // TODO: implement props
  List<Object?> get props => [_error];

  String? getError() { return _error; }

}