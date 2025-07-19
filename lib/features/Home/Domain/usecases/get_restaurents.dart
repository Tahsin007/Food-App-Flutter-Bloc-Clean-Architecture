import 'package:fpdart/fpdart.dart';
import 'package:stack_food/core/error/failure.dart';
import 'package:stack_food/core/usecases/usecase.dart';
import 'package:stack_food/features/Home/Domain/entities/restaurent_entity.dart';
import 'package:stack_food/features/Home/Domain/repositories/home_repository.dart';

class GetRestaurentsUseCase implements UseCase<List<RestaurentEntity>, GetRestaurentsParams> {
  final HomeRepository repository;

  GetRestaurentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<RestaurentEntity>>> call(GetRestaurentsParams params) async{
    return await repository.getRestaurents(offset: params.offset, limit: params.limit);
  }

}

class GetRestaurentsParams {
  final int offset;
  final int limit;

  GetRestaurentsParams({required this.offset, required this.limit});
}
