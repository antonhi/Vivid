import 'package:flutter/cupertino.dart';

class AppGalleryService {

  final PageController _galleryController = PageController();
  int _currentGalleryElement = 0;
  int _maxElements = 1;

  PageController getGalleryController() { return _galleryController; }
  int getCurrentGalleryElement() { return _currentGalleryElement; }

  void goToNextElement() {
    _galleryController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
    _currentGalleryElement++;
  }

  void goToPreviousElement() {
    _galleryController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
    _currentGalleryElement--;
  }

  void setMaxElements(int elements) { _maxElements = elements; }

  void handleSwipe(int index) {
    _currentGalleryElement = index;
  }

  void dispose() {
    _galleryController.dispose();
  }

  bool atMax() { return _currentGalleryElement == _maxElements-1; }

}