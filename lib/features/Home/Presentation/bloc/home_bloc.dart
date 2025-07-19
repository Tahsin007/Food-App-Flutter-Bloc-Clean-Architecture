import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_banners.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_categories.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_food_campaigns.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_popular_products.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_restaurents.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_event.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBannersUseCase getBanners;
  final GetCategoriesUseCase categoriesUseCase;
  final GetPopularProductsUseCase getPopularProductsUseCase;
  final GetFoodCampaignsUseCase getFoodCampaignsUseCase;
  final GetRestaurentsUseCase getRestaurentsUseCase;

  HomeBloc(this.getBanners, this.categoriesUseCase,this.getPopularProductsUseCase,this.getFoodCampaignsUseCase,this.getRestaurentsUseCase)
      : super(HomeState.initial()) {
    on<FetchBanners>(_onFetchBanners);
    on<FetchCategories>(_onFetchCategories);
    on<FetchPopularProducts>(_onFecthPropularProducts);
    on<FetchFoodCampaigns>(_onFetchFoodCampaigns);
    on<FetchRestaurents>(_onFetchRestaurents);
  }

  Future<void> _onFetchBanners(FetchBanners event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoadingBanners: true, error: null));

    final result = await getBanners(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(isLoadingBanners: false, error: failure.message)),
      (banners) => emit(state.copyWith(isLoadingBanners: false, banners: banners)),
    );
  }

  Future<void> _onFetchCategories(FetchCategories event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoadingCategories: true, error: null));

    final result = await categoriesUseCase(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(isLoadingCategories: false, error: failure.message)),
      (categories) => emit(state.copyWith(isLoadingCategories: false, categories: categories)),
    );
  }

  Future<void> _onFecthPropularProducts(FetchPopularProducts event, Emitter<HomeState> emit) async{
     emit(state.copyWith(isLoadingPopularProducts: true, error: null));

    final result = await getPopularProductsUseCase(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(isLoadingPopularProducts: false, error: failure.message)),
      (products) => emit(state.copyWith(isLoadingPopularProducts: false, products: products)),
    );
  }

  Future<void> _onFetchFoodCampaigns(FetchFoodCampaigns event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoadingFoodCampaigns: true, error: null));

    final result = await getFoodCampaignsUseCase(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(isLoadingFoodCampaigns: false, error: failure.message)),
      (foodCampaigns) => emit(state.copyWith(isLoadingFoodCampaigns: false, foodCampaigns: foodCampaigns)),
    );
  }

  Future<void> _onFetchRestaurents(FetchRestaurents event, Emitter<HomeState> emit) async {
    if (state.hasReachedMax) return;

    emit(state.copyWith(isLoadingRestaurents: true, error: null));

    final result = await getRestaurentsUseCase(GetRestaurentsParams(offset: event.offset, limit: event.limit));

    result.fold(
      (failure) => emit(state.copyWith(isLoadingRestaurents: false, error: failure.message)),
      (restaurents) {
        if (restaurents.isEmpty) {
          emit(state.copyWith(isLoadingRestaurents: false, hasReachedMax: true));
        } else {
          emit(state.copyWith(
            isLoadingRestaurents: false,
            restaurents: List.of(state.restaurents ?? [])..addAll(restaurents),
            hasReachedMax: false,
          ));
        }
      },
    );
  }
}

