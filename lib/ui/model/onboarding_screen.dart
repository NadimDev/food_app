import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth/sign_up.dart';
import '../onboarding/onboarding_controller.dart';
import '../utils/color_file.dart';
import '../utils/text_format.dart';
import 'onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController _onboardingController = OnboardingController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _onboardingController.pageController,
                itemCount: _onboardingController.onBoardingPage.length,
                onPageChanged: (int index) {
                  currentIndex = index;
                },
                itemBuilder: (context, index) {
                  final page = _onboardingController.onBoardingPage[index];
                  return buildPage(page);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                      effect: const ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 16,
                        activeDotColor: Colors.blue,
                        dotColor: Colors.grey,
                      ),
                      controller: _onboardingController.pageController,
                      count: _onboardingController.onBoardingPage.length),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            if (currentIndex <
                                _onboardingController.onBoardingPage.length -
                                    1) {
                              _onboardingController.pageController
                                  .jumpToPage(2);
                            }
                          },
                          child: Text(
                            'Skip',
                            style: TextFile.header2Text(),
                          )),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorFile.primaryColor,
                        ),
                        onPressed: () {
                          if (currentIndex ==
                              _onboardingController.onBoardingPage.length - 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => SignUp(),
                              ),
                            );
                          } else {
                            _onboardingController.pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          }
                        },
                        child: Text(
                            style: TextFile.header2Text()
                                .copyWith(color: Colors.white),
                            currentIndex ==
                                    _onboardingController
                                            .onBoardingPage.length -
                                        1
                                ? 'Get Started'
                                : 'Next'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildPage(OnboardingModel page) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          page.image,
          height: 400,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          page.title,
          style: TextFile.headerTextStyle(),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          page.description,
          style: TextFile.header3Text(),
        ),
      ],
    );
  }
}
