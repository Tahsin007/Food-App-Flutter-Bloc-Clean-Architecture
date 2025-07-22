import 'package:fpdart/fpdart.dart';
import 'package:stack_food/core/error/exceptions.dart';
import 'package:stack_food/core/error/failure.dart';
import 'package:stack_food/core/network/network_info.dart';
import 'package:stack_food/features/Home/Data/datasources/home_remote_data_source.dart';
import 'package:stack_food/features/Home/Domain/entities/banner_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/category_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/food_campaign_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/product_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/restaurent_entity.dart';
import 'package:stack_food/features/Home/Domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  Future<Either<Failure, T>> _handleRequest<T>(Future<T> Function() request) async {
    try {
      if (!await networkInfo.isConnected) {
        return Left(Failure('No internet connection'));
      }
      final result = await request();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    } on DataParsingException catch (e) {
      return Left(Failure(e.message));
    } catch (e) {
      return Left(Failure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    return _handleRequest(() => remoteDataSource.getBanners());
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    return _handleRequest(() => remoteDataSource.getCategories());
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getPopularProducts() async {
    return _handleRequest(() => remoteDataSource.getPopularProducts());
  }

  @override
  Future<Either<Failure, List<FoodCampaignEntity>>> getFoodCampaigns() async {
    return _handleRequest(() => remoteDataSource.getFoodcampaigns());
  }

  @override
  Future<Either<Failure, List<RestaurentEntity>>> getRestaurents(
      {required int offset, required int limit}) async {
    return _handleRequest(() => remoteDataSource.getRestaurents(offset: offset, limit: limit));
  }
}
