import 'package:flutter/material.dart';
import 'package:tenderglass/screens/home_screen.dart';

import 'package:iconsax/iconsax.dart';
import 'package:tenderglass/screens/onboarding_screen.dart';
import 'package:tenderglass/ui/component/appBar.dart';
import 'package:tenderglass/ui/screen/home.dart';

import '../screens/home.dart';
import 'constants.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
          currentIndex: newIndex,
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          backgroundColor: kwhite,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(255, 160, 127, 230),
          unselectedItemColor: kgrey,
          unselectedIconTheme: const IconThemeData(color: kgrey),
          selectedIconTheme:
              const IconThemeData(color: Color.fromARGB(255, 160, 127, 230)),
          unselectedFontSize: 9,
          selectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.discover), label: 'Discover'),
            BottomNavigationBarItem(icon: Icon(Iconsax.shop), label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.personalcard4), label: 'Wallet'),
          ],
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _screens = [
    OnBoardingScreen(),
    HomeScreen(),
    Home(),
    MainApp(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, child) {
          return _screens[index];
        },
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}

enum TabItem { home, explore, notification, setting }

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: appBar(
              left: Icon(Icons.notes, color: Colors.black54),
              title: 'Wallets',
              right: Icon(Icons.account_balance_wallet, color: Colors.black54)),
        ),
      ),
      body: HomeScreenWallet(),
    );
  }
}
