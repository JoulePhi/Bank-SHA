import 'package:bank_sha/routes/route_name.dart';
import 'package:bank_sha/ui/pages/home.dart';
import 'package:bank_sha/ui/pages/onboarding_page.dart';
import 'package:bank_sha/ui/pages/signin_page.dart';
import 'package:bank_sha/ui/pages/signup_ktp_page.dart';
import 'package:bank_sha/ui/pages/signup_page.dart';
import 'package:bank_sha/ui/pages/signup_setprofile_page.dart';
import 'package:bank_sha/ui/pages/signup_success_page.dart';
import 'package:bank_sha/ui/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';

class AppPages {
  static Map<String, WidgetBuilder> pages = {
    PagesName.splashPage: (c) => const SplashPage(),
    PagesName.onboardingPage: (c) => const OnboardingPage(),
    PagesName.signinPage: (c) => const SigninPage(),
    PagesName.signupPage: (c) => const SignupPage(),
    PagesName.signupProfilePage: (c) => const SignupProfilePage(),
    PagesName.signupKtpPage: (c) => const SignupKtpPage(),
    PagesName.signupSuccessPage: (c) => const SignupSuccessPage(),
    PagesName.homePage: (c) => const HomePage(),
  };
}
