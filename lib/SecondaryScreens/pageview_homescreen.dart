import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';
import 'package:taste_application/SecondaryScreens/circle_retaurants.dart';
import 'package:taste_application/SecondaryScreens/meal_view.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:taste_application/models/restaurant.dart';

import '../provider_files/taste_provider.dart';
import '4buttons_hc.dart';

class PageViewHomeScreen extends StatefulWidget {
  const PageViewHomeScreen({super.key});

  @override
  State<PageViewHomeScreen> createState() => _PageViewHomeScreenState();
}

class _PageViewHomeScreenState extends State<PageViewHomeScreen> {
  LoopPageController contoller = LoopPageController(viewportFraction: 0.85);
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 50), (Timer timer) {
      if (currentPage < context.read<TasteProvider>().taste_Meals.length) {
        currentPage++;
        contoller.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 1500),
          curve: Curves.easeIn,
        );
      } else {
        currentPage = -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: LoopPageView.builder(
            controller: contoller,
            onPageChanged: (value) => setState(() {
              currentPage = value;
            }),
            itemCount: context.watch<TasteProvider>().taste_Meals.length,
            itemBuilder: (context, position) {
              Restaurant restaurant = restuarantFinder(context
                  .watch<TasteProvider>()
                  .taste_Meals[position]
                  .restaurantId);
              return InkWell(
                onTap: () {
                  context.read<TasteProvider>().UpdateSelectedMeal(
                      context.read<TasteProvider>().taste_Meals[position]);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 800),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                          pageBuilder: (_, __, ___) =>
                              const Material(child: TasteMealViewPage())));
                },
                child: Stack(children: [
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(context
                                .watch<TasteProvider>()
                                .taste_Meals[position]
                                .imageUrl)),
                        borderRadius: BorderRadius.circular(30),
                        color: position.isEven
                            ? const Color(0xFF69c5df)
                            : const Color.fromARGB(255, 181, 132, 227)),
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Column(children: const []),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        margin: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 30),
                        width: 300,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(85, 3, 0, 0)),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  context
                                      .watch<TasteProvider>()
                                      .taste_Meals[position]
                                      .title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.restaurant_menu,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          Text(
                                            restaurant.title,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            restaurant.rate.toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.price_change_sharp,
                                            color: Colors.green[900],
                                          ),
                                          Text(
                                            "${context.watch<TasteProvider>().taste_Meals[position].price}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.blue[700],
                                        ),
                                        Text(restaurant.location),
                                      ],
                                    ),
                                  ],
                                )
                              ]),
                        )),
                  )
                ]),
              );
            },
          ),
        ),
        SizedBox(
          width: 150,
          height: 20,
          child: PageViewDotIndicator(
            currentItem: currentPage,
            count: context.watch<TasteProvider>().taste_Meals.length,
            unselectedColor: Colors.black26,
            selectedColor: Theme.of(context).colorScheme.primary,
            size: const Size(12, 12),
            unselectedSize: const Size(8, 8),
            duration: const Duration(milliseconds: 400),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            fadeEdges: false,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 120,
          child: TasteCircleRetaurants(),
        ),
        Container(
          height: 220,
          margin: const EdgeInsets.only(top: 20),
          child: const BottomPartHomePage(),
        )
      ],
    );
  }

  Restaurant restuarantFinder(String resID) {
    Restaurant restaurant = context
        .watch<TasteProvider>()
        .taste_Restaurants
        .firstWhere((element) => element.id == resID);

    return restaurant;
  }
}
