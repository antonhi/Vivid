import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationState extends Equatable {
  Widget getPage(BuildContext context);
}