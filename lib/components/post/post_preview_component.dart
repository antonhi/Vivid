import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectvivid/components/buttons/button_text_and_icon_vertical_component.dart';
import 'package:projectvivid/components/post/post_video_component.dart';
import 'package:projectvivid/components/profile/profile_picture_and_username_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';
import 'package:projectvivid/models/user_model.dart';

import '../../models/post_model.dart';

class PostPreviewComponent extends StatefulWidget {

  final PostModel post;
  final double width;
  final bool isInView;

  const PostPreviewComponent({Key? key,
    required this.post,
    required this.width,
    required this.isInView}) : super(key: key);

  @override
  State<PostPreviewComponent> createState() => _PostPreviewComponentState();
}

class _PostPreviewComponentState extends State<PostPreviewComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(10),
            child: PostVideo(post: widget.post, width: widget.width, isInView: widget.isInView)),
        const SizedBox(height: 10,),
        SizedBox(
          width: widget.width/2,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonIconAndTextVerticalComponent(
                    buttonColor: AppColorConfiguration.transparent, 
                    textColor: AppColorConfiguration.secondary, 
                    text: '123', 
                    height: 50,
                    onTap: () => {}, 
                    icon: Icon(Icons.comment_rounded, size: 25, color: AppColorConfiguration.white,),
                    iconIsAbove: true),
                ProfilePictureAndUsernameComponent(user: UserModel(username: 'anton'), height: 40),
                ButtonIconAndTextVerticalComponent(
                    buttonColor: AppColorConfiguration.transparent,
                    textColor: AppColorConfiguration.secondary,
                    text: '50',
                    height: 50,
                    onTap: () => {},
                    icon: Icon(Icons.heart_broken, size: 25, color: AppColorConfiguration.white,),
                    iconIsAbove: true)
              ],
            ),
          ),
        )
      ],
    );
  }
}

