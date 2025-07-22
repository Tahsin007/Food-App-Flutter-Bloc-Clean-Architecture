import 'package:stack_food/features/Home/Domain/entities/food_campaign_entity.dart';

class FoodCampaignModel extends FoodCampaignEntity {
  FoodCampaignModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.avgRating,
    required super.price,
    required super.discount,
    required super.discountType,
    required super.restaurentName,
  });

  factory FoodCampaignModel.fromJson(Map<String, dynamic> json) {
    return FoodCampaignModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_full_url'],
      avgRating: json['avg_rating'] is int
          ? (json['avg_rating'] as int)
          : (json['avg_rating'] as double).toInt(),
      price: json['price'],
      discount: json['discount'],
      discountType: json['discount_type'] ?? 'percentage',
      restaurentName: json['restaurant_name'] ?? 'Unknown Restaurant',
    );
  }
}