class RestaurentEntity {
  int id;
  String name;
  String deliveryTime;
  String deliveryFee;
  int orderCount;
  double avgRating;
  String imageUrl;

  RestaurentEntity({
    required this.id,
    required this.name,
    required this.deliveryTime,
    required this.orderCount,
    required this.avgRating,
    required this.imageUrl,
    required this.deliveryFee,
  });
}