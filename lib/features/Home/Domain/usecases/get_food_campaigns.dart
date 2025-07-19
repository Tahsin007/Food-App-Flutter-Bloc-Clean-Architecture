import 'package:fpdart/fpdart.dart';
import 'package:stack_food/core/error/failure.dart';
import 'package:stack_food/core/usecases/usecase.dart';
import 'package:stack_food/features/Home/Domain/entities/food_campaign_entity.dart';
import 'package:stack_food/features/Home/Domain/repositories/home_repository.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_categories.dart';

class GetFoodCampaignsUseCase implements UseCase<List<FoodCampaignEntity>, NoParams> {
  final HomeRepository repository;

  GetFoodCampaignsUseCase(this.repository);

  @override
  Future<Either<Failure, List<FoodCampaignEntity>>> call(NoParams params) async{
    return await repository.getFoodCampaigns();
  }

}