import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_banners.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_categories.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_popular_products.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_event.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBannersUseCase getBanners;
  final GetCategoriesUseCase categoriesUseCase;
  final GetPopularProductsUseCase getPopularProductsUseCase;

  HomeBloc(this.getBanners, this.categoriesUseCase,this.getPopularProductsUseCase)
      : super(HomeState.initial()) {
    on<FetchBanners>(_onFetchBanners);
    on<FetchCategories>(_onFetchCategories);
    on<FetchPopularProducts>(_onFecthPropularProducts);
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
}

