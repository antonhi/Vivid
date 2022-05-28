import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/feed/controllers/feed_controller.dart';
import 'package:projectvivid/feed/pages/feed_home_page.dart';
import 'package:projectvivid/feed/states/feed_state.dart';
import 'app_state.dart';

class AppFeedState extends AppState {

  @override
  List<Object?> get props => [];

  @override
  Widget getPage(BuildContext context) {
    return BlocProvider<FeedController>(
      create: (context) => FeedController(FeedState()),
      child: const FeedHomePage(),
    );
  }

}