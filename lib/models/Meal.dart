// ignore_for_file: public_member_api_docs, sort_constructors_first

class Meal {
  late final String id;
  final String restaurantId;
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isInCart;
  Meal(
      {required this.id,
      required this.restaurantId,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.description,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.isInCart});
}
