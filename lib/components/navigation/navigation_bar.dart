import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/app/controllers/app_controller.dart';
import 'package:projectvivid/app/states/app_state.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';

class NavigationBarComponent extends StatelessWidget {

  final double width, height;
  final Color backgroundColor;
  final Map<Icon, Function()> options;

  const NavigationBarComponent({Key? key,
    required this.width,
    required this.backgroundColor,
    required this.options,
    required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getIcons(),
      ),
    );
  }

  List<Widget> _getIcons() {
    List<Widget> icons = [];
    for (Icon icon in options.keys) {
      icons.add(
        GestureDetector(
          child: icon,
          onTap: options[icon],
        )
      );
    }
    return icons;
  }

  static Map<Icon, Function()> getMainOptions(int page, BuildContext context) {
    Map<Icon, Function()> options = {};
    options[Icon(Icons.play_arrow_rounded, color: page == 1 ? AppColorConfiguration.accent :
      AppColorConfiguration.white, size: 30,)] = () => BlocProvider.of<AppController>(context).showFeed();
    options[Icon(Icons.person, color: page == 2 ? AppColorConfiguration.accent :
    AppColorConfiguration.white, size: 30)] = () => BlocProvider.of<AppController>(context).showProfile();
    options[Icon(Icons.mail_outline_rounded, color: page == 3 ? AppColorConfiguration.accent :
    AppColorConfiguration.white, size: 30)] = () => BlocProvider.of<AppController>(context).showFeed();
    return options;
  }

}