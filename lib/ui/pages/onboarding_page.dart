import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/shared/colors.dart';
import 'package:bank_sha/shared/text_style.dart';
import 'package:bank_sha/shared/utils.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  final _carouselController = CarouselController();
  List<String> title = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together'
  ];
  List<String> subtitle = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/on_boarding_1.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/on_boarding_2.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/on_boarding_3.png',
                  height: 331,
                ),
              ],
              options: CarouselOptions(
                  onPageChanged: ((index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
                  height: 331,
                  viewportFraction: 1,
                  enableInfiniteScroll: false),
              carouselController: _carouselController,
            ),
            AppUtils.spaceV(40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    title[currentIndex],
                    style: AppTextStyle.blackPoppins(20, FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  AppUtils.spaceV(16),
                  Text(
                    subtitle[currentIndex],
                    style: AppTextStyle.greyPoppins(16, FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  AppUtils.spaceV(currentIndex == 2 ? 38 : 50),
                  currentIndex == 2
                      ? Column(
                          children: [
                            FilledButton(
                              title: 'Get Started',
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  PagesName.signupPage,
                                  (route) => false,
                                );
                              },
                            ),
                            AppUtils.spaceV(20),
                            PlainButton(
                              title: 'Sign In',
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  PagesName.signinPage,
                                  (route) => false,
                                );
                              },
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: currentIndex == 0
                                      ? AppColors.lightBlueColor
                                      : AppColors.lightBgColor,
                                  shape: BoxShape.circle),
                            ),
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: currentIndex == 1
                                      ? AppColors.lightBlueColor
                                      : AppColors.lightBgColor,
                                  shape: BoxShape.circle),
                            ),
                            Container(
                              width: 12,
                              height: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: currentIndex == 2
                                      ? AppColors.lightBlueColor
                                      : AppColors.lightBgColor,
                                  shape: BoxShape.circle),
                            ),
                            const Spacer(),
                            FilledButton(
                              title: 'Continue',
                              width: 150,
                              onPressed: () => _carouselController.nextPage(),
                            )
                          ],
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
