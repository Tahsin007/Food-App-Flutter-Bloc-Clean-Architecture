import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_banners.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_categories.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_event.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBannersUseCase getBanners;
  final GetCategoriesUseCase categoriesUseCase;

  HomeBloc(this.getBanners, this.categoriesUseCase)
      : super(HomeState.initial()) {
    on<FetchBanners>(_onFetchBanners);
    on<FetchCategories>(_onFetchCategories);
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
}

