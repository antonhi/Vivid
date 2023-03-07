import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationState extends Equatable {

  final String? _error;
  final bool _isAcknowledged;

  const AuthenticationState(this._error, this._isAcknowledged);

  Widget getPage(BuildContext context);
  String? getError() { return _error; }
  bool isAcknowledged()  { return _isAcknowledged; }

}