import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/components/post/post_inbox_preview_component.dart';
import 'package:projectvivid/components/search/search_bar_component.dart';
import 'package:projectvivid/components/status/status_bar_inbox_component.dart';
import 'package:projectvivid/inbox/controllers/inbox_controller.dart';
import 'package:projectvivid/inbox/states/inbox_state.dart';

import '../../components/navigation/navigation_bar_component.dart';
import '../../configuration/colors/app_color_configuration.dart';
import '../../profile/states/profile_state.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    double navigationWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<InboxController, InboxState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColorConfiguration.dark,
        body: Stack(
          children: [
            Positioned(
              child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Container(
                    margin: EdgeInsets.only(top: 60, left: navigationWidth*0.05, right: navigationWidth*0.05, bottom: 20),
                    child: Column(
                      children: [
                        StatusBarInboxComponent(width: navigationWidth*0.9),
                        const SizedBox(height: 25,),
                        SearchBarComponent(controller: TextEditingController(), placeholder: 'search users, keywords, more', height: 40, onTap: () => {}, onSubmit: (String submit) => {}, onChanged: (String submit) => {}, backgroundColor: AppColorConfiguration.tertiary),
                        const SizedBox(height: 30,),
                        Expanded(
                            child: ListView.separated(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                                itemBuilder: (context, _) {
                                  return PostInboxPreviewComponent();
                                },
                                separatorBuilder: (context, _) {
                                  return SizedBox(height: 30);
                                },
                                itemCount: 10)
                        )
                      ],
                    ),
                  )
              ),
            ),
            Positioned(
              child: NavigationBarComponent(
                  width: navigationWidth*0.9,
                  backgroundColor: AppColorConfiguration.tertiary.withOpacity(0.75),
                  options: NavigationBarComponent.getMainOptions(1, context),
                  height: 60),
              bottom: 30,
              left: navigationWidth*0.05,
            )
          ],
        ),
      );
    });
  }
}
