import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stack_food/core/constants/api_constants.dart';
import 'package:stack_food/core/error/exceptions.dart';
import 'package:stack_food/core/network/network_info.dart';
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
  Future<List<RestaurentModel>> getRestaurents({required int offset, required int limit});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;
  final NetworkInfo networkInfo;

  HomeRemoteDataSourceImpl({required this.client, required this.networkInfo});

  Future<T> _performRequest<T>(
      Future<http.Response> Function() request,
      T Function(dynamic) fromJson,
      ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await request();
        if (response.statusCode == 200) {
          try {
            final data = json.decode(response.body);
            return fromJson(data);
          } catch (e) {
            throw DataParsingException('Failed to parse data');
          }
        } else {
          throw ServerException('Server error: ${response.statusCode}');
        }
      } catch (e) {
        throw ServerException('Failed to connect to the server');
      }
    } else {
      throw NoInternetException('No internet connection');
    }
  }

  @override
  Future<List<BannerModel>> getBanners() async {
    return _performRequest(
          () => client.get(
        Uri.parse('${ApiConstants.apiUrl!}/api/v1/banners'),
        headers: {
          'Content-Type': ApiConstants.contentType,
          'zoneId': ApiConstants.zoneId,
          'latitude': ApiConstants.latitude,
          'longitude': ApiConstants.longitude,
        },
      ),
          (data) {
        final bannerResponse = BannerResponse.fromJson(data);
        return bannerResponse.banners!
            .map(
              (banner) => BannerModel(
            id: banner.id,
            title: banner.title,
            image: banner.image,
          ),
        )
            .toList();
      },
    );
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    return _performRequest(
          () => client.get(
        Uri.parse('${ApiConstants.apiUrl!}/api/v1/categories'),
        headers: {
          'Content-Type': ApiConstants.contentType,
          'zoneId': ApiConstants.zoneId,
          'latitude': ApiConstants.latitude,
          'longitude': ApiConstants.longitude,
        },
      ),
          (data) {
        final List<dynamic> categoriesList = data;
        return categoriesList
            .map((category) => CategoryModel.fromJson(category))
            .toList();
      },
    );
  }

  @override
  Future<List<PopularProductModel>> getPopularProducts() async {
    return _performRequest(
          () => client.get(
        Uri.parse('${ApiConstants.apiUrl!}/api/v1/products/popular'),
        headers: {
          'Content-Type': ApiConstants.contentType,
          'zoneId': ApiConstants.zoneId,
          'latitude': ApiConstants.latitude,
          'longitude': ApiConstants.longitude,
        },
      ),
          (data) {
        final productResponse = PopularProductsResponse.fromJson(data);
        return productResponse.products!;
      },
    );
  }

  @override
  Future<List<FoodCampaignModel>> getFoodcampaigns() async {
    return _performRequest(
          () => client.get(
        Uri.parse('${ApiConstants.apiUrl!}/api/v1/campaigns/item'),
        headers: {
          'Content-Type': ApiConstants.contentType,
          'zoneId': ApiConstants.zoneId,
          'latitude': ApiConstants.latitude,
          'longitude': ApiConstants.longitude,
        },
      ),
          (data) {
        final List<dynamic> campaignList = data;
        return campaignList
            .map((food) => FoodCampaignModel.fromJson(food))
            .toList();
      },
    );
  }

  @override
  Future<List<RestaurentModel>> getRestaurents(
      {required int offset, required int limit}) async {
    return _performRequest(
          () => client.get(
        Uri.parse(
            '${ApiConstants.apiUrl!}/api/v1/restaurants/get-restaurants/all?offset=$offset&limit=$limit'),
        headers: {
          'Content-Type': ApiConstants.contentType,
          'zoneId': ApiConstants.zoneId,
          'latitude': ApiConstants.latitude,
          'longitude': ApiConstants.longitude,
        },
      ),
          (data) {
        final restaurentResponse = RestaurentResponse.fromJson(data);
        return restaurentResponse.restaurants;
      },
    );
  }
}
