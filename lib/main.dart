import 'package:flutter/material.dart';
import 'package:tenderglass/screens/home_screen.dart';
import 'package:tenderglass/screens/loginpage.dart';
import 'package:tenderglass/screens/onboarding_screen.dart';
import 'package:tenderglass/screens/registerpage.dart';
import 'package:tenderglass/ui/profile.dart';
import 'package:tenderglass/ui/settings.dart';
import 'package:tenderglass/widgets/bottomnavbar.dart';
import 'package:tenderglass/widgets/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenderglass/widgets/tabbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: kwhite,
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
        routes: {
          '/login': ((context) => const LoginScreen()),
          '/bottomnavbar': ((context) => MainScreen()),
          '/homescreen': ((context) => HomeScreen()),
          '/onboarding': ((context) => OnBoardingScreen()),
          '/registerpage': ((context) => RegisterPage()),          
          '/settings': ((context) => SettingsUI()),
        },
      );
    });
  }
}
