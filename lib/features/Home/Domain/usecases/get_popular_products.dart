import 'package:fpdart/fpdart.dart';
import 'package:stack_food/core/error/failure.dart';
import 'package:stack_food/core/usecases/usecase.dart';
import 'package:stack_food/features/Home/Domain/entities/product_entity.dart';
import 'package:stack_food/features/Home/Domain/repositories/home_repository.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_categories.dart';

class GetPopularProductsUseCase implements UseCase<List<ProductEntity>, NoParams> {
  final HomeRepository repository;

  GetPopularProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async{
    return await repository.getPopularProducts();
  }

}