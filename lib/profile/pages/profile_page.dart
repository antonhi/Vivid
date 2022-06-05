import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/components/status/status_bar_profile_component.dart';
import 'package:projectvivid/components/status/status_bar_profile_stats_component.dart';
import 'package:projectvivid/components/text/text_large_bolded_component.dart';
import 'package:projectvivid/components/text/text_large_component.dart';
import 'package:projectvivid/components/text/text_medium_bolded_component.dart';
import 'package:projectvivid/components/text/text_medium_component.dart';
import 'package:projectvivid/components/text/text_subtitle_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';
import 'package:projectvivid/profile/controllers/profile_controller.dart';
import 'package:projectvivid/profile/states/profile_state.dart';

import '../../components/navigation/navigation_bar_component.dart';
import '../../components/post/post_preview_component.dart';
import '../../models/post_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double navigationWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<ProfileController, ProfileState>(builder: (context, state) {
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
                        StatusBarProfileComponent(width: navigationWidth*0.9),
                        CircleAvatar(backgroundColor: AppColorConfiguration.white, maxRadius: navigationWidth*0.15,),
                        const SizedBox(height: 5,),
                        const TextLargeBoldedComponent(textColor: AppColorConfiguration.white, text: 'anton'),
                        const SizedBox(height: 5,),
                        const TextMediumComponent(textColor: AppColorConfiguration.secondary, text: 'developer | writer'),
                        const SizedBox(height: 10,),
                        StatusBarProfileStatsComponent(width: navigationWidth*0.9),
                        NavigationBarComponent(width: navigationWidth*0.9, backgroundColor: AppColorConfiguration.transparent, options: _getProfileNavigation(), height: 50),
                        Expanded(
                            child: ListView.separated(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                                itemBuilder: (context, _) {
                                  return PostPreviewComponent(
                                      post: PostModel(id: 'ids',
                                          url: '',
                                          type: 'video',
                                          user: 'anton'),
                                      width: navigationWidth * 0.9,
                                      isInView: true);
                                },
                                separatorBuilder: (context, _) {
                                  return SizedBox(height: 20);
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

  Map<Icon, Function()> _getProfileNavigation() {
    Map<Icon, Function()> options = {};
    options[Icon(Icons.crop_square_rounded, color: AppColorConfiguration.secondary, size: 25,)] = () {};
    options[Icon(Icons.apps_rounded, color: AppColorConfiguration.white, size: 25,)] = () {};
    return options;
  }
}
