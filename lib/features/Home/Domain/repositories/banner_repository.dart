import 'package:stack_food/features/Home/Domain/entities/banner_entity.dart';

abstract class HomeRepository {
  Future<List<BannerEntity>> getBanners();
}
