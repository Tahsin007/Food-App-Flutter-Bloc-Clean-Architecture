import 'package:stack_food/features/Home/Domain/entities/restaurent_entity.dart';

class RestaurentResponse{
  String filterData;
  int totalSize;
  String limit;
  String offset;
  List<RestaurentModel> restaurants;

  RestaurentResponse(
      {required this.filterData,
      required this.totalSize,
      required this.limit,
      required this.offset,
      required this.restaurants}
  );

  RestaurentResponse.fromJson(Map<String, dynamic> json)
      : filterData = json['filter_data'] ?? '',
        totalSize = json['total_size'] ?? 0,
        limit = json['limit'] ?? '',
        offset = json['offset'] ?? '',
        restaurants = json['restaurants'] != null
            ? List<RestaurentModel>.from(
                (json['restaurants'] as List).map((v) => RestaurentModel.fromJson(v)))
            : <RestaurentModel>[];
}

class RestaurentModel extends RestaurentEntity{
  RestaurentModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.avgRating,
    required super.deliveryTime,
    required super.orderCount,
    required super.deliveryFee,
  });

  factory RestaurentModel.fromJson(Map<String, dynamic> json) {
    return RestaurentModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['cover_photo_full_url'],
      avgRating: json['avg_rating'] is double
          ? (json['avg_rating'] as double)
          : (json['avg_rating'] as int).toDouble(),
      deliveryTime: json['delivery_time'],
      orderCount: json['order_count'],
      deliveryFee: json['delivery_fee']
    );
  }
}