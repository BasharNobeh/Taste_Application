// ignore_for_file: non_constant_identifier_names
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:taste_application/models/Meal.dart';
import 'package:taste_application/models/dummy_data.dart';
import 'package:taste_application/models/restaurant.dart';

class TasteProvider with ChangeNotifier {
  late Meal selectedMeal;
  late Restaurant selectedRestaurant;
  int counter = 0;
  var taste_Restaurants = DUMMY_restaurants;
  var taste_Meals = DUMMY_MEALS;
  var edited_Taste_resturants;
  var resturant_page_title;

  void UpdateSelectedMeal(Meal meal) {
    selectedMeal = meal;
    notifyListeners();
  }

  void UpdateSelectedRestaurant(Restaurant restaurant) {
    selectedRestaurant = restaurant;

    notifyListeners();
  }

  void UpdateSelectedRestaurantsList(String condition) {
    if (condition == "fastest delivery") {
      edited_Taste_resturants =
          DUMMY_restaurants.where((element) => element.fastestDelivery == true)
              .toList();
      resturant_page_title = "Fastest Delivery";
    } else if (condition == "near me") {
      edited_Taste_resturants =
          DUMMY_restaurants.where((element) => element.nearMe == true).toList();
      resturant_page_title = "Near You";
    } else if (condition == "hot offers") {
      edited_Taste_resturants =
          DUMMY_restaurants.where((element) => element.hotOffers == true)
              .toList();
      resturant_page_title = "Hot Offers";
    } else if (condition == "highest rate") {
      edited_Taste_resturants =
          DUMMY_restaurants.where((element) => element.rate > 4).toList();
      resturant_page_title = "Highest Rate";
    } else {
      edited_Taste_resturants = DUMMY_restaurants.toList();
      resturant_page_title = "Restaurants";
    }
  }

  Future<String> UserLoginChecker(String user_name, String password) async {
    final response = await http.get(
      Uri.parse(
          'http://192.168.1.63:8080/Taste_BackEnd/LoginChecker?Email=$user_name&Password=$password'),
    );
    print(response.body);
    return response.body;
  }

  Future<String> UserSignUpChecker(String user_name, String password) async {
    final response = await http.get(
      Uri.parse(
          'http://192.168.1.63:8080/Taste_BackEnd/SignupChecker?Email=$user_name&Password=$password'),
    );

    return response.body;
  }
}
