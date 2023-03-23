import 'package:crawllet/Routes/app_routes.dart';
import 'package:crawllet/Screens/about_screen.dart';
import 'package:crawllet/Screens/all_card_screen.dart';
import 'package:crawllet/Screens/crypto_rates_screen.dart';
import 'package:crawllet/Screens/forgot_password_screen.dart';
import 'package:crawllet/Screens/get_started_screen.dart';
import 'package:crawllet/Screens/home_screen.dart';
import 'package:crawllet/Screens/login_screen.dart';
import 'package:crawllet/Screens/navigation_screen.dart';
import 'package:crawllet/Screens/signup_screen.dart';
import 'package:crawllet/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      initialRoute: AppRoutes.splashScreen,
      getPages: [
        GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
        GetPage(
            name: AppRoutes.getStartedScreen,
            page: () => const GetStartedScreen()),
        GetPage(name: AppRoutes.loginScreen, page: () => const LoginScreen()),
        GetPage(name: AppRoutes.signupScreen, page: () => const SignupScreen()),
        GetPage(
            name: AppRoutes.forgotPasswordScreen,
            page: () => const ForgotPasswordScreen()),
        GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
        GetPage(name: AppRoutes.allCards, page: () => const AllCards()),
        GetPage(
            name: AppRoutes.cryptoRates, page: () => const CryptoRatesScreen()),
        GetPage(name: AppRoutes.aboutScreen, page: () => const AboutScreen()),
      ],
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const NavigationScreen(
                num: 0,
              );
            } else {
              return const SplashScreen();
            }
          }
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
