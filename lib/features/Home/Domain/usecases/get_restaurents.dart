import 'package:fpdart/fpdart.dart';
import 'package:stack_food/core/error/failure.dart';
import 'package:stack_food/core/usecases/usecase.dart';
import 'package:stack_food/features/Home/Domain/entities/restaurent_entity.dart';
import 'package:stack_food/features/Home/Domain/repositories/home_repository.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_categories.dart';

class GetRestaurentsUseCase implements UseCase<List<RestaurentEntity>, NoParams> {
  final HomeRepository repository;

  GetRestaurentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<RestaurentEntity>>> call(NoParams params) async{
    return await repository.getRestaurents();
  }

}
