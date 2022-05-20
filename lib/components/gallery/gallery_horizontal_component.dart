import 'package:flutter/cupertino.dart';

class GalleryHorizontalComponent extends StatelessWidget {

  final double elementWidth;
  final PageController controller;
  final List<Widget> elements;
  final Function(int) onPageChanged;

  const GalleryHorizontalComponent({Key? key,
    required this.elementWidth,
    required this.elements,
    required this.controller,
    required this.onPageChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      scrollDirection: Axis.horizontal,
      children: List.generate(elements.length,
              (index) => SizedBox(width: elementWidth, child: elements.elementAt(index),))
    );
  }
}
