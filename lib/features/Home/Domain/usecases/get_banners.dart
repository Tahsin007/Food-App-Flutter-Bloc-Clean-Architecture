import 'package:stack_food/features/Home/Domain/entities/banner_entity.dart';
import 'package:stack_food/features/Home/Domain/repositories/banner_repository.dart';

class GetBanners {
  final HomeRepository repository;

  GetBanners(this.repository);

  Future<List<BannerEntity>> call() async {
    return await repository.getBanners();
  }
}
