import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:stack_food/core/theme/app_theme.dart';


import 'package:stack_food/features/Home/Domain/usecases/get_banners.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_bloc.dart';
import 'package:stack_food/features/Home/Presentation/pages/home.dart';
import 'package:stack_food/init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Stack Food',
        theme: AppTheme.lightTheme,
        home: const StackFoodHome(),
      ),
    );
  }
}
