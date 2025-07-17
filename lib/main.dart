import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:stack_food/core/theme/app_theme.dart';
import 'package:stack_food/features/Home/Data/datasources/home_remote_data_source.dart';
import 'package:stack_food/features/Home/Data/repositories/home_repository_impl.dart';
import 'package:stack_food/features/Home/Domain/usecases/get_banners.dart';
import 'package:stack_food/features/Home/Presentation/bloc/banner_bloc.dart';
import 'package:stack_food/features/Home/Presentation/pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannerBloc(
        GetBanners(
          HomeRepositoryImpl(
            remoteDataSource: HomeRemoteDataSourceImpl(client: http.Client()),
          ),
        ),
      ),
      child: MaterialApp(
        title: 'Stack Food',
        theme: AppTheme.lightTheme,
        home: const StackFoodHome(),
      ),
    );
  }
}
