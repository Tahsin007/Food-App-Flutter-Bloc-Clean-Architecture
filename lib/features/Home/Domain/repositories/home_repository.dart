import 'package:fpdart/fpdart.dart';
import 'package:stack_food/core/error/failure.dart';
import 'package:stack_food/features/Home/Domain/entities/banner_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/category_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/product_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<BannerEntity>>> getBanners();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<ProductEntity>>> getPopularProducts();
}
