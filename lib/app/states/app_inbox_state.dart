import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/inbox/controllers/inbox_controller.dart';
import 'package:projectvivid/inbox/pages/inbox_page.dart';
import 'package:projectvivid/inbox/states/inbox_state.dart';

import 'app_state.dart';

class AppInboxState extends AppState {

  @override
  List<Object?> get props => [];

  @override
  Widget getPage(BuildContext context) {
    return BlocProvider<InboxController>(
      create: (context) => InboxController(InboxState()),
      child: const InboxPage(),
    );
  }

}