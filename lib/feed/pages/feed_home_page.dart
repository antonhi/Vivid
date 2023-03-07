import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/components/navigation/navigation_bar_component.dart';
import 'package:projectvivid/components/post/post_preview_component.dart';
import 'package:projectvivid/components/search/search_bar_component.dart';
import 'package:projectvivid/components/status/status_bar_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';
import 'package:projectvivid/feed/controllers/feed_controller.dart';
import 'package:projectvivid/feed/states/feed_state.dart';
import 'package:projectvivid/models/post_model.dart';

class FeedHomePage extends StatefulWidget {
  const FeedHomePage({Key? key}) : super(key: key);

  @override
  State<FeedHomePage> createState() => _FeedHomePageState();
}

class _FeedHomePageState extends State<FeedHomePage> {

  @override
  Widget build(BuildContext context) {
    double navigationWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<FeedController, FeedState>(builder: (context, state) {
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
                      StatusBarComponent(width: navigationWidth*0.9),
                      const SizedBox(height: 10,),
                      SearchBarComponent(
                          controller: TextEditingController(),
                          placeholder: 'Search makes, models...',
                          height: 60,
                          onTap: () => {},
                          onSubmit: (String submitted) => {},
                          onChanged: (String submitted) => {},
                          backgroundColor: AppColorConfiguration.quaternary),
                      const SizedBox(height: 10,),
                      NavigationBarComponent(
                          width: navigationWidth*0.9,
                          backgroundColor: AppColorConfiguration.transparent,
                          options: getFeedNavigation(),
                          height: 50),
                      const SizedBox(height: 20,),
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
                      ),
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

  Map<Icon, Function()> getFeedNavigation() {
    Map<Icon, Function()> options = {};
    options[Icon(Icons.trending_up, color: AppColorConfiguration.secondary, size: 25,)] = () {};
    options[Icon(Icons.home_rounded, color: AppColorConfiguration.white, size: 25,)] = () {};
    options[Icon(Icons.people, color: AppColorConfiguration.secondary, size: 25,)] = () {};
    return options;
  }

}
