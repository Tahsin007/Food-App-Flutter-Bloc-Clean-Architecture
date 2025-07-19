class ProductEntity {
  int id;
  String name;
  String description;
  String imageUrl;
  double avgRating;
  int price;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.avgRating,
    required this.price
});

}