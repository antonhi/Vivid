import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {

  final String? _error;
  final bool _isAcknowledged;

  const AuthenticationState(this._error, this._isAcknowledged);

  @override
  // TODO: implement props
  List<Object?> get props => [_error, _isAcknowledged];

  String? getError() { return _error; }
  bool isAcknowledged()  { return _isAcknowledged; }

}