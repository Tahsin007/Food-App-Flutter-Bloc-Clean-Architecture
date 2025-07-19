abstract class HomeEvent {}

class FetchBanners extends HomeEvent {}

class FetchCategories extends HomeEvent {}

class FetchPopularProducts extends HomeEvent{}

class FetchFoodCampaigns extends HomeEvent {}

class FetchRestaurents extends HomeEvent {
  final int offset;
  final int limit;

  FetchRestaurents({required this.offset, required this.limit});
}
