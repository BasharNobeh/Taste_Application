// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names

enum Affordability { $, $$, $$$ }

enum RestaurantType {
  Traditional,
  Fast_Food,
  SeaFood,
  Chinese,
  Korean,
  Japanese,
  Italian,
  Smoke_House
}

class Restaurant {
  final String id;
  final String title;
  final String location;
  final double rate;
  final Affordability affordability;
  final String imageUrl;
  final RestaurantType restaurantType;
  final fastestDelivery;
  final hotOffers;
  final nearMe;
  bool isFavorite;
  Restaurant(
      {required this.id,
      required this.title,
      required this.location,
      required this.rate,
      required this.affordability,
      required this.imageUrl,
      required this.restaurantType,
      required this.fastestDelivery,
      required this.hotOffers,
      required this.nearMe,
      required this.isFavorite});
}
