import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/components/navigation/navigation_bar.dart';
import 'package:projectvivid/components/search/search_bar.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';
import 'package:projectvivid/feed/controllers/feed_controller.dart';
import 'package:projectvivid/feed/states/feed_state.dart';

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
                  margin: const EdgeInsets.only(top: 60, left: 10, right: 10, bottom: 20),
                  child: SearchBarComponent(
                      controller: TextEditingController(),
                      placeholder: 'search games, creators, more',
                      height: 60,
                      onTap: () => {},
                      onSubmit: (String submitted) => {},
                      onChanged: (String submitted) => {},
                      backgroundColor: AppColorConfiguration.tertiary),
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
