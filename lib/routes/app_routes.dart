import 'package:deanash_28/feature/auth/sign_in/screen/signin_screen.dart';
import 'package:deanash_28/feature/splash/screen/splash_screen.dart';
import 'package:get/route_manager.dart';

import '../feature/auth/forgot_password/screen/forgot_password_screen.dart';
import '../feature/auth/forgot_password/screen/otp_forgot_screen.dart';
import '../feature/auth/forgot_password/screen/otp_registration_screen.dart';
import '../feature/auth/forgot_password/screen/update_password_screen.dart';
import '../feature/auth/sign_up/screen/registration_screen.dart';
import '../feature/home/screem/home_page.dart';
import '../feature/onboarding/screen/onboarding_screen1.dart';
import '../feature/onboarding/screen/onboarding_screen2.dart';

class AppRoute {
  //splash
  static String splashScreen = '/splashScreen';
  // auth
  static String signInScreen = '/signInScreen';
  static String registrationScreen = '/registrationScreen';
  static String forgotPasswordScreen = '/forgotPasswordScreen';
  static String otpForgotScreen = '/otpForgotScreen';
  static String otpRegistrationScreen = '/otpRegistrationScreen';
  static String updatePasswordScreen = '/updatePasswordScreen';

  //onboarding
  static String onboardingScreen1 = '/onboardingScreen1';
  static String onboardingScreen2 = '/onboardingScreen2';

  //home
  static String homeScreen = '/homeScreen';

  //auth
  static String getSplashScreen() => splashScreen;
  static String getSignInScreen() => signInScreen;
  static String getRegistrationScreen() => registrationScreen;
  static String getForgotPasswordScreen() => forgotPasswordScreen;
  static String getOtpForgotScreen() => otpForgotScreen;
  static String getOtpRegistrationScreen() => otpRegistrationScreen;
  static String getUpdatePasswordScreen() => updatePasswordScreen;

  //onboarding
  static String getOnboardingScreen1() => onboardingScreen1;
  static String getOnboardingScreen2() => onboardingScreen2;
  //home
  static String getHomeScreen() => homeScreen;
  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),

    //auth
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: registrationScreen,
      page: () => RegistrationScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: otpForgotScreen,
      page: () => OtpForgotScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: updatePasswordScreen,
      page: () => UpdatePasswordScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: otpRegistrationScreen,
      page: () => OtpRegistrationScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    //onboarding
    GetPage(
      name: onboardingScreen1,
      page: () => OnboardingScreen1(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: onboardingScreen2,
      page: () => OnboardingScreen2(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    //home
    GetPage(
      name: homeScreen,
      page: () => HomePage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
