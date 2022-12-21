import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taste_application/SecondaryScreens/restaurant_view.dart';
import 'package:taste_application/models/restaurant.dart';

import '../provider_files/taste_provider.dart';

class TasteCircleRetaurants extends StatefulWidget {
  const TasteCircleRetaurants({super.key});

  @override
  State<TasteCircleRetaurants> createState() => _TasteCircleRetaurantsState();
}

class _TasteCircleRetaurantsState extends State<TasteCircleRetaurants> {
  PageController pageController =
      PageController(viewportFraction: 0.40, initialPage: 3);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        padEnds: false,
        controller: pageController,
        itemCount: context.watch<TasteProvider>().taste_Restaurants.length,
        itemBuilder: (context, position) {
          Restaurant restaurant =
              context.watch<TasteProvider>().taste_Restaurants[position];

          return Container(
              child: InkWell(
            onTap: () {
              context
                  .read<TasteProvider>()
                  .UpdateSelectedRestaurant(restaurant);

              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                      pageBuilder: (_, __, ___) =>
                          const Material(child: TasteRestaurantView())));
            },
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    restaurant.imageUrl,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).colorScheme.secondary),
                    child: Text(
                      restaurant.title,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                )
              ],
            ),
          ));
        });
  }
}
