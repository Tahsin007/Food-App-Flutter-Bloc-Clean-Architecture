import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_event.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_state.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/category_card.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/section_header.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchCategories());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingCategories) {
          return Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        } else if (state.categories != null && state.categories!.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: "Popular Food Nearby"),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories!.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      name: state.categories![index].title,
                      imageUrl: state.categories![index].imageFullUrl,
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Text("No categories Available");
        }
      },
    );
  }
}

class CategoryItem {
  final String name;
  final IconData icon;
  final Color color;

  CategoryItem(this.name, this.icon, this.color);
}
