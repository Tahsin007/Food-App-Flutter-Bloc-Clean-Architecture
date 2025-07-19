class FoodCampaignEntity {
  int id;
  String name;
  String description;
  String imageUrl;
  int avgRating;
  int price;
  int discount;
  String discountType;

  FoodCampaignEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.avgRating,
    required this.price,
    required this.discount,
    required this.discountType,
});

}