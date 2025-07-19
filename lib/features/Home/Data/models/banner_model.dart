import 'package:stack_food/features/Home/Domain/entities/banner_entity.dart';

class BannerResponse {
  List<Null>? campaigns;
  List<BannerModel>? banners;

  BannerResponse({this.campaigns, this.banners});
    BannerResponse.fromJson(Map<String, dynamic> json) {
    if (json['campaigns'] != null) {
      campaigns = <Null>[];
      json['campaigns'].forEach((v) {
        campaigns!.add(null);
      });
    }
    if (json['banners'] != null) {
      banners = <BannerModel>[];
      json['banners'].forEach((v) {
        banners!.add( BannerModel.fromJson(v));
      });
    }
  }
}

class BannerModel extends BannerEntity {
  BannerModel({
    required super.id,
    required super.title,
    required super.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'],
      image: json['image_full_url'],
    );
  }
}
