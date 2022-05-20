import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AppState extends Equatable {
  Widget getPage(BuildContext context);
}