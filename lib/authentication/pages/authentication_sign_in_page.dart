import 'package:flutter/material.dart';
import 'package:projectvivid/components/buttons/button_text_and_icon_component.dart';
import 'package:projectvivid/components/form/form_text_field_component.dart';
import 'package:projectvivid/components/gallery/gallery_horizontal_component.dart';
import 'package:projectvivid/components/text/text_large_component.dart';
import 'package:projectvivid/components/text/text_title_component.dart';
import 'package:projectvivid/configuration/colors/background_color_configuration.dart';
import 'package:projectvivid/configuration/colors/button_color_configuration.dart';
import 'package:projectvivid/configuration/colors/text_color_configuration.dart';

class AuthenticationSignInPage extends StatefulWidget {
  const AuthenticationSignInPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationSignInPage> createState() => _AuthenticationSignInPageState();
}

class _AuthenticationSignInPageState extends State<AuthenticationSignInPage> {

  Map<String, TextEditingController> textEditingControllers = {};
  Map<String, FocusNode> textEditingFocusNodes = {};
  PageController galleryController = PageController();
  int field = 0;

  @override
  void initState() {
    _generateControllers();
    _generateFocusNodes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double navigationWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: BackgroundColorConfiguration.darkModePrimary,
      body: Center(
        child: SizedBox(
          width: navigationWidth-40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextTitleComponent(textColor: TextColorConfiguration.white, text: 'Sign In'),
              const SizedBox(height: 5,),
              const TextLargeComponent(text: 'It\'s Good To See You', textColor: TextColorConfiguration.secondary),
              const SizedBox(height: 30,),
              SizedBox(
                height: 60,
                child: GalleryHorizontalComponent(
                    elementWidth: navigationWidth,
                    elements: _getFields(),
                    controller: galleryController,
                  onPageChanged: (int index) {
                      field = index;
                      if (index == 0) { _requestEmailFocus(); }
                      else { _requestPasswordFocus(); }
                  }),
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonIconAndTextComponent(
                      buttonColor: ButtonColorConfiguration.transparent,
                      textColor: ButtonColorConfiguration.darkModePrimary,
                      text: 'Back',
                      height: 40,
                      onTap: () => field == 0 ? _navigateToHome(context) : _previousElementGallery(),
                      icon: const Icon(Icons.arrow_back_ios, color: TextColorConfiguration.white, size: 20,),
                      iconIsRight: false),
                  ButtonIconAndTextComponent(
                      buttonColor: ButtonColorConfiguration.transparent,
                      textColor: TextColorConfiguration.white,
                      text: 'Next',
                      height: 40,
                      onTap: () => field == 0 ? _nextElementGallery() : {},
                      icon: const Icon(Icons.arrow_forward_ios, color: TextColorConfiguration.white, size: 20,),
                      iconIsRight: true)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (String field in textEditingControllers.keys) {
      TextEditingController? controller = textEditingControllers[field];
      if (controller != null) controller.dispose();
    }
    for (String field in textEditingFocusNodes.keys) {
      FocusNode? focusNode = textEditingFocusNodes[field];
      if (focusNode != null) focusNode.dispose();
    }
    galleryController.dispose();
    super.dispose();
  }

  void _generateControllers() {
    textEditingControllers['email'] = TextEditingController();
    textEditingControllers['password'] = TextEditingController();
  }

  void _generateFocusNodes() {
    textEditingFocusNodes['email'] = FocusNode();
    textEditingFocusNodes['password'] = FocusNode();
  }

  List<Widget> _getFields() {
    List<Widget> fields = [];
    for (String placeholder in textEditingControllers.keys) {
      fields.add(
          FormTextFieldComponent(
              lineColor: TextColorConfiguration.secondary,
              focusNode: textEditingFocusNodes[placeholder] ?? FocusNode(),
              placeholder: placeholder,
              action: TextInputAction.next,
              controller: textEditingControllers[placeholder] ?? TextEditingController()));
    }
    return fields;
  }

  void _nextElementGallery() {
    galleryController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    field++;
    _requestPasswordFocus();
  }

  void _previousElementGallery() {
    galleryController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    field--;
    _requestEmailFocus();
  }

  void _requestEmailFocus() {
    textEditingFocusNodes['email']?.requestFocus();
  }

  void _requestPasswordFocus() {
    textEditingFocusNodes['password']?.requestFocus();
  }

  void _navigateToHome(BuildContext context) {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }

}

