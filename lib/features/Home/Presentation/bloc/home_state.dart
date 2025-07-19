import 'package:stack_food/features/Home/Domain/entities/banner_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/category_entity.dart';

class HomeState {
  final bool isLoadingBanners;
  final bool isLoadingCategories;
  final List<BannerEntity>? banners;
  final List<CategoryEntity>? categories;
  final String? error;

  const HomeState({
    this.isLoadingBanners = false,
    this.isLoadingCategories = false,
    this.banners,
    this.categories,
    this.error,
  });

  HomeState copyWith({
    bool? isLoadingBanners,
    bool? isLoadingCategories,
    List<BannerEntity>? banners,
    List<CategoryEntity>? categories,
    String? error,
  }) {
    return HomeState(
      isLoadingBanners: isLoadingBanners ?? this.isLoadingBanners,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      banners: banners ?? this.banners,
      categories: categories ?? this.categories,
      error: error,
    );
  }

  factory HomeState.initial() => const HomeState();
}
