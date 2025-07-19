import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:stack_food/features/Home/Data/datasources/home_remote_data_source.dart';
import 'package:stack_food/features/Home/Data/repositories/home_repository_impl.dart';
import 'package:stack_food/features/Home/Domain/repositories/home_repository.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_banners.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_categories.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_food_campaigns.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_popular_products.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_restaurents.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<http.Client>(
    () => http.Client(),
  ); // Register http.Client

  // Initialize Home dependencies
  _initHome();
}

void _initHome() {
  // Register Home Remote Data Source
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(client: sl()),
  );

  // Register Home Repository
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl()),
  );

  // Register Use Cases
  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(sl()),
  );
  sl.registerLazySingleton<GetBannersUseCase>(() => GetBannersUseCase(sl()));
  sl.registerLazySingleton<GetPopularProductsUseCase>(
    () => GetPopularProductsUseCase(sl()),
  );
  sl.registerLazySingleton<GetFoodCampaignsUseCase>(
    () => GetFoodCampaignsUseCase(sl()),
  );
  sl.registerLazySingleton<GetRestaurentsUseCase>(
    () => GetRestaurentsUseCase(sl()),
  );

  // Register Home Bloc
  sl.registerFactory<HomeBloc>(
    () => HomeBloc(
      sl<GetBannersUseCase>(),
      sl<GetCategoriesUseCase>(),
      sl<GetPopularProductsUseCase>(),
      sl<GetFoodCampaignsUseCase>(),
      sl<GetRestaurentsUseCase>(),
    ),
  );
}
