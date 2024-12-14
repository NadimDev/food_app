import 'package:flutter/cupertino.dart';

import '../model/onboarding_model.dart';

class OnboardingController {
  final PageController pageController = PageController();

  final List<OnboardingModel> onBoardingPage = [
    OnboardingModel(
      image: 'assets/images/screen1.png',
      title: 'Delicious Food',
      description: 'Order your favorite meals with ease!',
    ),
    OnboardingModel(
      image: 'assets/images/screen3.png',
      title: 'Quick Delivery',
      description: 'Get your food delivered in no time!',
    ),
    OnboardingModel(
      image: 'assets/images/screen2.png',
      title: 'Easy Payment',
      description: 'Pay conveniently using multiple options.',
    ),
  ];

  void dispose() {
    pageController.dispose();
  }
}