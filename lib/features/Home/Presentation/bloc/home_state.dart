import 'package:stack_food/features/Home/Domain/entities/banner_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/category_entity.dart';
import 'package:stack_food/features/Home/Domain/entities/product_entity.dart';

class HomeState {
  final bool isLoadingBanners;
  final bool isLoadingCategories;
  final bool isLoadingPopularProducts;
  final List<BannerEntity>? banners;
  final List<CategoryEntity>? categories;
  final List<ProductEntity>? products;
  final String? error;

  const HomeState({
    this.isLoadingPopularProducts=false,
    this.isLoadingBanners = false,
    this.isLoadingCategories = false,
    this.banners,
    this.categories,
    this.products,
    this.error,
  });

  HomeState copyWith({
    bool? isLoadingBanners,
    bool? isLoadingCategories,
    bool? isLoadingPopularProducts,
    List<BannerEntity>? banners,
    List<CategoryEntity>? categories,
    List<ProductEntity>? products,
    String? error,
  }) {
    return HomeState(
      isLoadingBanners: isLoadingBanners ?? this.isLoadingBanners,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      isLoadingPopularProducts: isLoadingPopularProducts?? this.isLoadingPopularProducts,
      banners: banners ?? this.banners,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      error: error,
    );
  }

  factory HomeState.initial() => const HomeState();
}
