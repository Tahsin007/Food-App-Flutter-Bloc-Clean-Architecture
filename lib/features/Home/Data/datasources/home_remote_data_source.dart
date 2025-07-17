import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stack_food/core/constants/app_constants.dart';
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
      Uri.parse('${AppConstants.apiUrl!}/api/v1/banners'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'zoneId': '[1]',
        'latitude': '23.735129',
        'longitude': '90.425614',
      },
    );

    print("Response body: ${response.body}");
    print("Response status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print("Decoded data: $data");
      return data.map((json) => BannerModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }
}
