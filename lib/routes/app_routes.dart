import 'package:deanash_28/feature/auth/sign_in/screen/signin_screen.dart';
import 'package:deanash_28/feature/splash/screen/splash_screen.dart';
import 'package:get/route_manager.dart';

import '../feature/auth/forgot_password/screen/forgot_password_screen.dart';
import '../feature/auth/forgot_password/screen/otp_forgot_screen.dart';
import '../feature/auth/forgot_password/screen/otp_registration_screen.dart';
import '../feature/auth/forgot_password/screen/update_password_screen.dart';
import '../feature/auth/sign_up/screen/registration_screen.dart';

class AppRoute {
  //splash
  static String splashScreen = '/splashScreen';
  // auth
  static String signInScreen = '/signInScreen';
  static String registrationScreen = '/registrationScreen';
  static String forgotPasswordScreen = '/forgotPasswordScreen';
  static String onboardingScreen = '/onboardingScreen';
  static String otpForgotScreen = '/otpForgotScreen';
  static String otpRegistrationScreen = '/otpRegistrationScreen';
  static String updatePasswordScreen = '/updatePasswordScreen';

  static String getSplashScreen() => splashScreen;
  static String getSignInScreen() => signInScreen;
  static String getRegistrationScreen() => registrationScreen;
  static String getForgotPasswordScreen() => forgotPasswordScreen;
  static String getOtpForgotScreen() => otpForgotScreen;
  static String getOtpRegistrationScreen() => otpRegistrationScreen;
  static String getOnboardingScreen() => onboardingScreen;
  static String getUpdatePasswordScreen() => updatePasswordScreen;
  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
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
    // GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
  ];
}
