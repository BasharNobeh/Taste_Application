import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taste_application/Primary_Screens/Home_Screen.dart';
import 'package:taste_application/models/restaurant.dart';

import '../models/Meal.dart';
import '../provider_files/taste_provider.dart';

class TasteMealViewPage extends StatefulWidget {
  const TasteMealViewPage({super.key});

  @override
  State<TasteMealViewPage> createState() => _TasteMealViewPageState();
}

class _TasteMealViewPageState extends State<TasteMealViewPage> {
  @override
  Widget build(BuildContext context) {
    Meal meal = context.watch<TasteProvider>().selectedMeal;
    Restaurant restaurant = context
        .read<TasteProvider>()
        .taste_Restaurants
        .firstWhere((element) => element.id == meal.restaurantId);
    return Container(
      child: Column(children: [
        AppBar(
          centerTitle: true,
          title: Text(
            restaurant.title,
            style: GoogleFonts.roboto(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(2, 5), // Shadow position
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      border: const Border.symmetric(
                        vertical: BorderSide(
                            width: 2,
                            color: Colors.grey,
                            style: BorderStyle.solid), //BorderSide
                        horizontal: BorderSide(
                            width: 2,
                            color: Colors.grey,
                            style: BorderStyle.solid), //BorderSide
                      ),
                      image: DecorationImage( 
                          fit: BoxFit.cover, image: AssetImage(meal.imageUrl))),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5, left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          meal.title,
                          style: GoogleFonts.roboto(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ),
              ]),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    InfoRows(Icons.hourglass_bottom,
                        "Delivery Within 35 Minutes", Colors.red),
                    const SizedBox(
                      height: 20,
                    ),
                    InfoRows(
                        Icons.star, restaurant.rate.toString(), Colors.orange),
                    const SizedBox(
                      height: 20,
                    ),
                    InfoRows(Icons.location_on_sharp, restaurant.location,
                        Colors.blue),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Description",
                        style: GoogleFonts.roboto(
                          color: const Color.fromARGB(255, 36, 36, 36),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Order Now"))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      meal.description,
                      style: GoogleFonts.roboto(
                        color: const Color.fromARGB(255, 36, 36, 36),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fixedSize: const Size.fromHeight(70)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 800),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                  pageBuilder: (_, __, ___) => const Material(
                                      child: TasteHomeScreen())));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text("Back To Home"),
                            Icon(Icons.home)
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Row InfoRows(IconData icon, String title, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 25,
          color: color,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: GoogleFonts.roboto(
            color: const Color.fromARGB(255, 36, 36, 36),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
