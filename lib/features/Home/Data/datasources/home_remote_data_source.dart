import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stack_food/core/constants/api_constants.dart';
import 'package:stack_food/features/Home/Data/models/banner_model.dart';
import 'package:stack_food/features/Home/Data/models/category_model.dart';
import 'package:stack_food/features/Home/Data/models/food_campaign_model.dart';
import 'package:stack_food/features/Home/Data/models/popular_product_model.dart';
import 'package:stack_food/features/Home/Data/models/restaurent_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerModel>> getBanners();
  Future<List<CategoryModel>> getCategories();
  Future<List<PopularProductModel>> getPopularProducts();
  Future<List<FoodCampaignModel>> getFoodcampaigns();
  Future<List<RestaurentModel>> getRestaurents();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;
  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<BannerModel>> getBanners() async {
    final response = await client.get(
      Uri.parse('${ApiConstants.apiUrl!}/api/v1/banners'),
      headers: {
        'Content-Type': ApiConstants.contentType,
        'zoneId': ApiConstants.zoneId,
        'latitude': ApiConstants.latitude,
        'longitude': ApiConstants.longitude,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final bannerResponse = BannerResponse.fromJson(data);
      // print("Decoded data: $bannerResponse");
      return bannerResponse.banners!
          .map(
            (banner) => BannerModel(
              id: banner.id,
              title: banner.title,
              image: banner.image,
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await client.get(
        Uri.parse('${ApiConstants.apiUrl!}/api/v1/categories'),
        headers: {
          'Content-Type': ApiConstants.contentType,
          'zoneId': ApiConstants.zoneId,
          'latitude': ApiConstants.latitude,
          'longitude': ApiConstants.longitude,
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> categoriesList = json.decode(response.body);
        final categoriResponse = categoriesList
            .map((category) => CategoryModel.fromJson(category))
            .toList();
        // print("Decoded data: $categoriResponse");
        // print("response : ${response.body}");
        return categoriResponse;
      } else {
        // print("Error fetching categories: ${response.statusCode}");
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      // print("Error fetching categories: $e");
      throw Exception('Failed to load categories');
    }
  }

  @override
  Future<List<PopularProductModel>> getPopularProducts() async {
    try {
      final response = await client.get(
        Uri.parse('${ApiConstants.apiUrl!}/api/v1/products/popular'),
        headers: {
          'Content-Type': ApiConstants.contentType,
          'zoneId': ApiConstants.zoneId,
          'latitude': ApiConstants.latitude,
          'longitude': ApiConstants.longitude,
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final productResponse = PopularProductsResponse.fromJson(data);
        print("Popular Product Data: ${response.statusCode}");
        return productResponse.products!;

      } else {
        print("Error fetching popular products: ${response.statusCode}");
        throw Exception('Failed to load propular products');
      }
    } catch (e) {
      print("Exception in getPopularProducts: $e");
      throw Exception('Failed to load popular products');
    }
  }
  
  @override
  Future<List<FoodCampaignModel>> getFoodcampaigns() async {
    try {
      final response = await client.get(
        Uri.parse('${ApiConstants.apiUrl!}/api/v1/campaigns/item'),
        headers: {
          'Content-Type': ApiConstants.contentType,
          'zoneId': ApiConstants.zoneId,
          'latitude': ApiConstants.latitude,
          'longitude': ApiConstants.longitude,
        },
      );
      if (response.statusCode == 200) {
        print("Food Campaign Data: ${response.statusCode}");
        final List<dynamic> data = json.decode(response.body);
        final campaignResponse = data
            .map((food) => FoodCampaignModel.fromJson(food))
            .toList();

        return campaignResponse;

      } else {
        print("Error fetching campaign products: ${response.statusCode}");
        throw Exception('Failed to load campaign products');
      }
    } catch (e) {
      print("Exception in getFoodCampaigns: $e");
      throw Exception('Failed to load food campaigns');
    }
  }
  
  @override
  Future<List<RestaurentModel>> getRestaurents() async {
    try {
      final response = await client.get(
        Uri.parse('${ApiConstants.apiUrl!}/api/v1/restaurants/get-restaurants/all?offset=1&limit=10'),
        headers: {
          'Content-Type': ApiConstants.contentType,
          'zoneId': ApiConstants.zoneId,
          'latitude': ApiConstants.latitude,
          'longitude': ApiConstants.longitude,
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final restaurentResponse = RestaurentResponse.fromJson(data);
        print("Restaurent Data: ${response.statusCode}");
        return restaurentResponse.restaurants;
      } else {
        throw Exception('Failed to load restaurants');
      }
    } catch (error) {
      throw Exception('Failed to load restaurants: $error');
    }
  }
}
