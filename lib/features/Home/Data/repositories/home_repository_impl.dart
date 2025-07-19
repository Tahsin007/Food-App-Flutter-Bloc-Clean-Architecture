import 'package:fpdart/fpdart.dart';
import 'package:stack_food/core/error/failure.dart';
import 'package:stack_food/features/Home/Data/datasources/home_remote_data_source.dart';
import 'package:stack_food/features/Home/Domain/entities/banner_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/category_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/food_campaign_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/product_entity.dart';
import 'package:stack_food/features/Home/Domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    try {
      final banners = await remoteDataSource.getBanners();
      return Right(banners);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getPopularProducts() async{
    try{
      final popularProducts = await remoteDataSource.getPopularProducts();
      return Right(popularProducts);
    }catch (e){
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FoodCampaignEntity>>> getFoodCampaigns() async {
    try {
      final foodCampaigns = await remoteDataSource.getFoodcampaigns();
      return Right(foodCampaigns);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
