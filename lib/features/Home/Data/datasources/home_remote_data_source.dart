import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stack_food/core/constants/api_constants.dart';
import 'package:stack_food/features/Home/Data/models/banner_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerModel>> getBanners();
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

    print("Response body: ${response.body}");
    print("Response status code: ${response.statusCode}");

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
}
