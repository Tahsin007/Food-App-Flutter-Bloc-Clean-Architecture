import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_banners.dart';
import 'package:stack_food/features/Home/Presentation/bloc/banner_event.dart';
import 'package:stack_food/features/Home/Presentation/bloc/banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetBanners getBanners;

  BannerBloc(this.getBanners) : super(BannerInitial()) {
    on<FetchBanners>((event, emit) async {
      emit(BannerLoading());
      try {
        final banners = await getBanners();
        emit(BannerLoaded(banners));
      } catch (e) {
        emit(BannerError(e.toString()));
      }
    });
  }
}
