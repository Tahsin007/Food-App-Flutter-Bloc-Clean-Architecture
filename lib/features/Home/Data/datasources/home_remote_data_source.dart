import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stack_food/core/constants/api_constants.dart';
import 'package:stack_food/features/Home/Data/models/banner_model.dart';
import 'package:stack_food/features/Home/Data/models/category_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerModel>> getBanners();
  Future<List<CategoryModel>> getCategories();
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
      print("Decoded data: $bannerResponse");
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
  Future<List<CategoryModel>> getCategories() async{
    try{
      final response = await client.get(
        Uri.parse('${ApiConstants.apiUrl!}/api/v1/categories'),
        headers: {
        'Content-Type': ApiConstants.contentType,
        'zoneId': ApiConstants.zoneId,
        'latitude': ApiConstants.latitude,
        'longitude': ApiConstants.longitude,
      },
      );
      if(response.statusCode == 200){
          final List<dynamic> categoriesList = json.decode(response.body);
          final categoriResponse = categoriesList
              .map((category) => CategoryModel.fromJson(category))
              .toList();
          print("Decoded data: $categoriResponse");
          print("response : ${response.body}");
          return categoriResponse;
      }else{
        print("Error fetching categories: ${response.statusCode}");
        throw Exception('Failed to load categories');
      }
    }catch (e){
      print("Error fetching categories: $e");
      throw Exception('Failed to load categories');
    }
  }
}
