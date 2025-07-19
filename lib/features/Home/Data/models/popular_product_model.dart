import 'package:stack_food/features/Home/Domain/entities/product_entity.dart';

class PopularProductsResponse {
  List<PopularProductModel>? products;

  PopularProductsResponse({this.products});

  PopularProductsResponse.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <PopularProductModel>[];
      json['products'].forEach((v) {
        products!.add(PopularProductModel.fromJson(v));
      });
    }
  }
}

class PopularProductModel extends ProductEntity {
  PopularProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.avgRating,
    required super.price,
  });

  factory PopularProductModel.fromJson(Map<String, dynamic> json) {
    return PopularProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_full_url'],
      avgRating: (json['avg_rating'] is int)
          ? (json['avg_rating'] as int).toDouble()
          : (json['avg_rating'] as double),
      price: json['price'],
    );
  }
}
