import 'package:deanash_28/feature/auth/sign_in/screen/signin_screen.dart';
import 'package:deanash_28/feature/splash/screen/splash_screen.dart';
import 'package:get/route_manager.dart';

import '../feature/auth/sign_up/screen/registration_screen.dart';

class AppRoute {
  //splash
  static String splashScreen = '/splashScreen';
  // auth
  static String signInScreen = '/signInScreen';
  static String registrationScreen = '/registrationScreen';
  static String onboardingScreen = '/onboardingScreen';

  static String getSplashScreen() => splashScreen;
  static String getSignInScreen() => signInScreen;
  static String getRegistrationScreen() => registrationScreen;
  static String getOnboardingScreen() => onboardingScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: signInScreen, page: () => SignInScreen(),transition: Transition.fade,transitionDuration: const Duration(milliseconds: 500)),
    GetPage(name: registrationScreen, page: () => RegistrationScreen(),transition: Transition.fade,transitionDuration: const Duration(milliseconds: 500)),
   // GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
  ];
}
