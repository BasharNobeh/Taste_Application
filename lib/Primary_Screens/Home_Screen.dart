import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taste_application/SecondaryScreens/restaurants_screen.dart';
import 'package:taste_application/SecondaryScreens/settings_screen.dart';

import '../SecondaryScreens/pageview_homescreen.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import '../provider_files/taste_provider.dart';

class TasteHomeScreen extends StatefulWidget {
  const TasteHomeScreen({super.key});

  @override
  State<TasteHomeScreen> createState() => _TasteHomeScreenState();
}

class _TasteHomeScreenState extends State<TasteHomeScreen> {
  @override
  int navBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
              width: double.infinity, child: navBarContoller(navBarIndex))),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          setState(() {
            navBarIndex = index;
          });
          if (controller.hasClients) {
            controller.animateToPage(navBarIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          }
        },
        iconSize: 25,
        activeColor: Theme.of(context).colorScheme.primary,
        selectedIndex: navBarIndex,
        barItems: [
          BarItem(
            icon: Icons.home,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.restaurant,
            title: 'Restaurants',
          ),
          BarItem(
            icon: Icons.settings,
            title: 'Settings',
          ),

          /// Add more BarItem if you want
        ],
      ),
    );
  }

  Widget navBarContoller(int index) {
    if (index == 0) {
      return const PageViewHomeScreen();
    } else if (index == 1) {
      context.watch<TasteProvider>().UpdateSelectedRestaurantsList("none");
      return const TasteRestaurantsPage();
    } else {
      return const TasteSettingsPage();
    }
  }
}
