import 'package:flutter/src/widgets/framework.dart';
import 'package:projectvivid/authentication/states/authentication_state.dart';

import '../pages/authentication_query_page.dart';

class AuthenticationQueryState extends AuthenticationState {
  const AuthenticationQueryState(String? error, bool isAcknowledged) : super(error, isAcknowledged);

  @override
  Widget getPage(BuildContext context) {
    return const AuthenticationQueryPage();
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}