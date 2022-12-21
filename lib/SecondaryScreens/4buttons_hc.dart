import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taste_application/SecondaryScreens/restaurants_screen.dart';

import '../provider_files/taste_provider.dart';

class BottomPartHomePage extends StatefulWidget {
  const BottomPartHomePage({super.key});

  @override
  State<BottomPartHomePage> createState() => _BottomPartHomePageState();
}

class _BottomPartHomePageState extends State<BottomPartHomePage> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          mainAxisExtent: 80,
          childAspectRatio: 2),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      children: [
        ElevatedButton(
            onPressed: () {
              context
                  .read<TasteProvider>()
                  .UpdateSelectedRestaurantsList("hot offers");
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                      pageBuilder: (_, __, ___) =>
                          const Material(child: TasteRestaurantsPage())));
            },
            style: ElevatedButton.styleFrom(
              shadowColor: const Color.fromARGB(110, 94, 94, 94),
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 12,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Hot Offers"),
                Icon(Icons.workspace_premium_outlined)
              ],
            )),
        ElevatedButton(
            onPressed: () {
              context
                  .read<TasteProvider>()
                  .UpdateSelectedRestaurantsList("highest rate");
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                      pageBuilder: (_, __, ___) =>
                          const Material(child: TasteRestaurantsPage())));
            },
            style: ElevatedButton.styleFrom(
              shadowColor: const Color.fromARGB(110, 94, 94, 94),
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 12,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Highest Rate"),
                Icon(Icons.star_border_outlined)
              ],
            )),
        ElevatedButton(
            onPressed: () {
              context
                  .read<TasteProvider>()
                  .UpdateSelectedRestaurantsList("near me");
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                      pageBuilder: (_, __, ___) =>
                          const Material(child: TasteRestaurantsPage())));
            },
            style: ElevatedButton.styleFrom(
              shadowColor: const Color.fromARGB(110, 94, 94, 94),
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 12,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [Text("Near Me"), Icon(Icons.pin_drop)],
            )),
        ElevatedButton(
            onPressed: () {
              context
                  .read<TasteProvider>()
                  .UpdateSelectedRestaurantsList("fastest delivery");
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                      pageBuilder: (_, __, ___) =>
                          const Material(child: TasteRestaurantsPage())));
            },
            style: ElevatedButton.styleFrom(
              shadowColor: const Color.fromARGB(110, 94, 94, 94),
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 12,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Fastest Delivery"),
                Icon(Icons.directions_bike_rounded)
              ],
            )),
      ],
    );
  }
}
