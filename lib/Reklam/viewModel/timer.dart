import 'dart:async';
import 'package:flutter/material.dart';

class AdTimer {
  final List<String> adUrls;
  final PageController pageController;
  int _currentPage = 0;
  Timer? _timer;

  AdTimer({required this.adUrls, required this.pageController});

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < adUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }
}
