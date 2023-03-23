import 'package:crawllet/Screens/about_screen.dart';
import 'package:crawllet/Screens/all_card_screen.dart';
import 'package:crawllet/Screens/crypto_rates_screen.dart';
import 'package:crawllet/Screens/home_screen.dart';
import 'package:crawllet/Theme/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class NavigationScreen extends StatefulWidget {
  final int num;
  const NavigationScreen({super.key, required this.num});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.num;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      const AllCards(),
      const CryptoRatesScreen(),
      const AboutScreen()
    ];
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: WaterDropNavBar(
        waterDropColor: MainColors.drawingFillColor,
        inactiveIconColor: MainColors.backgroundColors,
        backgroundColor: MainColors.foregroundColor,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedIndex: currentIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_filled,
          ),
          BarItem(
              filledIcon: Icons.credit_card,
              outlinedIcon: Icons.credit_card_rounded),
          BarItem(
            filledIcon: Icons.currency_bitcoin,
            outlinedIcon: Icons.currency_bitcoin_rounded,
          ),
          BarItem(
              filledIcon: Icons.person,
              outlinedIcon: Icons.person_add_alt_1_rounded),
        ],
      ),
    );
  }
}
