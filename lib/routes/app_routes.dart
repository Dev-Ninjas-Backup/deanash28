import 'package:deanash_28/feature/splash/screen/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoute {
  //splash
   static String splashScreen = '/splashScreen';

   static String getSplashScreen() => splashScreen;

  static List<GetPage> routes = [
     GetPage(name: splashScreen, page: () => SplashScreen()),
  ];
}
