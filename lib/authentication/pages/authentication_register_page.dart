import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectvivid/app/controllers/app_controller.dart';
import 'package:projectvivid/components/buttons/button_text_component.dart';
import 'package:projectvivid/components/form/form_acknowledge_component.dart';
import 'package:projectvivid/configuration/colors/app_color_configuration.dart';

import '../../app/services/app_gallery_service.dart';
import '../../components/buttons/button_text_and_icon_component.dart';
import '../../components/error/error_notification_component.dart';
import '../../components/form/form_text_field_component.dart';
import '../../components/gallery/gallery_horizontal_component.dart';
import '../../components/text/text_large_component.dart';
import '../../components/text/text_title_component.dart';
import '../controllers/authentication_controller.dart';
import '../states/authentication_state.dart';
import 'authentication_sign_in_page.dart';

class AuthenticationRegisterPage extends StatefulWidget {
  const AuthenticationRegisterPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationRegisterPage> createState() => _AuthenticationRegisterPageState();
}

class _AuthenticationRegisterPageState extends State<AuthenticationRegisterPage> {

  final Map<String, TextEditingController> _textEditingControllers = {};
  final Map<String, FocusNode> _textEditingFocusNodes = {};
  final AppGalleryService _inputGalleryService = AppGalleryService();

  @override
  void initState() {
    _generateControllers();
    _generateFocusNodes();
    _inputGalleryService.setMaxElements(4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double navigationWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<AuthenticationController, AuthenticationState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColorConfiguration.dark,
        body: Center(
          child: SizedBox(
            width: navigationWidth-40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedSwitcher(duration: const Duration(milliseconds: 300),
                  child: state.getError() == null ? const SizedBox(height: 0,) :
                  const ErrorNotificationComponent(text: 'Testing', height: 50),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,),
                const TextTitleComponent(textColor: AppColorConfiguration.white, text: 'Register'),
                const SizedBox(height: 5,),
                const TextLargeComponent(text: 'Welcome', textColor: AppColorConfiguration.secondary),
                const SizedBox(height: 30,),
                SizedBox(
                  height: 60,
                  child: GalleryHorizontalComponent(
                      elementWidth: navigationWidth,
                      elements: _getFields(state.getError(), state.isAcknowledged()),
                      controller: _inputGalleryService.getGalleryController(),
                      onPageChanged: (int index) {
                        _inputGalleryService.handleSwipe(index);
                        _handleFocus();
                      }),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonIconAndTextComponent(
                        buttonColor: AppColorConfiguration.transparent,
                        textColor: AppColorConfiguration.white,
                        text: 'Back',
                        height: 40,
                        onTap: () => _inputGalleryService.getCurrentGalleryElement() == 0 ?
                        _navigateToHome(context) : _previousElementGallery(),
                        icon: const Icon(Icons.arrow_back_ios, color: AppColorConfiguration.white, size: 20,),
                        iconIsRight: false),
                    ButtonIconAndTextComponent(
                        buttonColor: AppColorConfiguration.transparent,
                        textColor: AppColorConfiguration.white,
                        text: 'Next',
                        height: 40,
                        onTap: () => !_inputGalleryService.atMax() ?
                          _nextElementGallery() :
                          BlocProvider.of<AuthenticationController>(context).update('Testing error', state.isAcknowledged()),
                        icon: const Icon(Icons.arrow_forward_ios, color: AppColorConfiguration.white, size: 20,),
                        iconIsRight: true)
                  ],
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: navigationWidth/3,
                  child: ButtonTextComponent(
                      buttonColor: AppColorConfiguration.tertiary,
                      textColor: AppColorConfiguration.white,
                      text: 'Sign In',
                      height: 40,
                      onTap: () => _navigateToSignIn(context)),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    for (String field in _textEditingControllers.keys) {
      TextEditingController? controller = _textEditingControllers[field];
      if (controller != null) controller.dispose();
    }
    for (String field in _textEditingFocusNodes.keys) {
      FocusNode? focusNode = _textEditingFocusNodes[field];
      if (focusNode != null) focusNode.dispose();
    }
    _inputGalleryService.dispose();
    super.dispose();
  }

  void _generateControllers() {
    _textEditingControllers['email'] = TextEditingController();
    _textEditingControllers['password'] = TextEditingController();
    _textEditingControllers['username'] = TextEditingController();
  }

  void _generateFocusNodes() {
    _textEditingFocusNodes['email'] = FocusNode();
    _textEditingFocusNodes['password'] = FocusNode();
    _textEditingFocusNodes['username'] = FocusNode();
  }

  List<Widget> _getFields(String? error, bool acknowledged) {
    List<Widget> fields = [];
    for (String placeholder in _textEditingControllers.keys) {
      fields.add(
          FormTextFieldComponent(
            lineColor: AppColorConfiguration.secondary,
            focusNode: _textEditingFocusNodes[placeholder] ?? FocusNode(),
            placeholder: placeholder,
            action: placeholder == 'username' ? TextInputAction.done : TextInputAction.next,
            controller: _textEditingControllers[placeholder] ?? TextEditingController(),
            onSubmitted: (String text) => _nextElementGallery(),));
    }
    fields.add(
        FormAcknowledgeWidget(
          text: 'I accept the Terms and Conditions',
          termsAndConditionsAcknowledged: acknowledged,
          onChange: (bool? status) =>
              BlocProvider.of<AuthenticationController>(context).update(error, status ?? false)
        )
    );
    return fields;
  }

  void _nextElementGallery() {
    _inputGalleryService.goToNextElement();
    _handleFocus();
  }

  void _previousElementGallery() {
    _inputGalleryService.goToPreviousElement();
    _handleFocus();
  }

  void _handleFocus() {
    switch (_inputGalleryService.getCurrentGalleryElement()) {
      case 0:
        _requestEmailFocus();
        break;
      case 1:
        _requestPasswordFocus();
        break;
      case 2:
        _requestUsernameFocus();
        break;
      case 3:
        _closeUsernameFocus();
    }
  }

  void _requestEmailFocus() {
    _textEditingFocusNodes['email']?.requestFocus();
  }

  void _requestPasswordFocus() {
    _textEditingFocusNodes['password']?.requestFocus();
  }

  void _requestUsernameFocus() {
    _textEditingFocusNodes['username']?.requestFocus();
  }

  void _closeUsernameFocus() {
    if (_textEditingFocusNodes['username'] != null &&_textEditingFocusNodes['username']!.hasPrimaryFocus) {
      _textEditingFocusNodes['username']?.unfocus();
    }
  }

  void _navigateToHome(BuildContext context) {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
  
  void _navigateToSignIn(BuildContext context) {
    BlocProvider.of<AppController>(context).showFeed();
    /*Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<AuthenticationController>(
          create: (context) => AuthenticationController(const AuthenticationState(null, false)),
          child: const AuthenticationSignInPage()
      );
    }));*/
  }
}

