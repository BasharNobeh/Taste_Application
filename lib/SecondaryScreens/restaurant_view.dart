import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taste_application/models/restaurant.dart';

import '../models/Meal.dart';
import '../provider_files/taste_provider.dart';

class TasteRestaurantView extends StatefulWidget {
  const TasteRestaurantView({super.key});

  @override
  State<TasteRestaurantView> createState() => _TasteRestaurantViewState();
}

class _TasteRestaurantViewState extends State<TasteRestaurantView> {
  @override
  Widget build(BuildContext context) {
    Restaurant restaurant = context.watch<TasteProvider>().selectedRestaurant;
    Iterable<Meal> restaurantMeals = context
        .read<TasteProvider>()
        .taste_Meals
        .where((element) => element.restaurantId == restaurant.id);
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(children: [
          AppBar(
              centerTitle: true,
              title: Text(
                restaurant.title,
                style: Theme.of(context).textTheme.titleSmall,
              )),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 231, 230, 230),
              border: null,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(children: [
              ...restaurantMeals.map((item) => Column(
                    children: [
                      Container(
                          color: const Color.fromARGB(255, 247, 212, 212),
                          width: double.infinity,
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            title: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 243, 93, 93),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(item.imageUrl))),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Description",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Divider(
                                          color:
                                              Color.fromARGB(255, 60, 60, 60),
                                          thickness: 6,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            item.description,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 45, 45, 45),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 170,
                                    height: 200,
                                    child: Center(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            RightSectionOfEachMeal(
                                                item.isGlutenFree,
                                                "Gluten Free"),
                                            RightSectionOfEachMeal(
                                                item.isGlutenFree,
                                                "Lactose Free"),
                                            RightSectionOfEachMeal(
                                                item.isGlutenFree, "Vegan"),
                                            RightSectionOfEachMeal(
                                                item.isGlutenFree,
                                                "Vegetarian"),
                                            ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  shadowColor:
                                                      const Color.fromARGB(
                                                          110, 94, 94, 94),
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                  elevation: 12,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16,
                                                      vertical: 4),
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                25)),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: const [
                                                    Text("Order Now"),
                                                    Icon(
                                                        Icons.drive_eta_rounded)
                                                  ],
                                                )),
                                          ]),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ))
            ]),
          ),
        ]),
      ),
    );
  }

  Row RightSectionOfEachMeal(bool Value, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Value ? Icons.done : Icons.close,
          color: Value ? Colors.green : Colors.red,
        )
      ],
    );
  }
}
