import 'package:stack_food/features/Home/Domain/entities/banner_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/category_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/food_campaign_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/product_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/restaurent_entity.dart';

class HomeState {
  final bool isLoadingBanners;
  final bool isLoadingCategories;
  final bool isLoadingPopularProducts;
  final bool isLoadingFoodCampaigns;
  final bool isLoadingRestaurents;
  final List<BannerEntity>? banners;
  final List<CategoryEntity>? categories;
  final List<ProductEntity>? products;
  final List<FoodCampaignEntity>? foodCampaigns;
  final List<RestaurentEntity>? restaurents;
  final bool hasReachedMax;
  final String? error;

  const HomeState({
    this.isLoadingPopularProducts=false,
    this.isLoadingBanners = false,
    this.isLoadingCategories = false,
    this.isLoadingFoodCampaigns = false,
    this.isLoadingRestaurents = false,
    this.restaurents,
    this.banners,
    this.categories,
    this.products,
    this.foodCampaigns,
    this.hasReachedMax = false,
    this.error,
  });

  HomeState copyWith({
    bool? isLoadingBanners,
    bool? isLoadingCategories,
    bool? isLoadingPopularProducts,
    bool? isLoadingFoodCampaigns,
    bool? isLoadingRestaurents,
    List<RestaurentEntity>? restaurents,
    List<BannerEntity>? banners,
    List<CategoryEntity>? categories,
    List<ProductEntity>? products,
    List<FoodCampaignEntity>? foodCampaigns,
    bool? hasReachedMax,
    String? error,
  }) {
    return HomeState(
      isLoadingBanners: isLoadingBanners ?? this.isLoadingBanners,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      isLoadingPopularProducts: isLoadingPopularProducts?? this.isLoadingPopularProducts,
      isLoadingFoodCampaigns: isLoadingFoodCampaigns ?? this.isLoadingFoodCampaigns,
      isLoadingRestaurents: isLoadingRestaurents ?? this.isLoadingRestaurents,
      restaurents: restaurents ?? this.restaurents,
      foodCampaigns: foodCampaigns ?? this.foodCampaigns,
      banners: banners ?? this.banners,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      error: error,
    );
  }

  factory HomeState.initial() => const HomeState();
}
