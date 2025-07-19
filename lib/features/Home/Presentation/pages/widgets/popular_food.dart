import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_event.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_state.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/foodcard.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/section_header.dart';

class PopularFoodSection extends StatefulWidget {
  const PopularFoodSection({super.key});

  @override
  State<PopularFoodSection> createState() => _PopularFoodSectionState();
}

class _PopularFoodSectionState extends State<PopularFoodSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(FetchPopularProducts());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingPopularProducts) {
          return Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        } else if (state.products != null && state.products!.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: 'Popular Food Nearby'),
              Container(
                height: 200,
                child: ListView.builder(
                  // padding: EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.products!.length,
                  itemBuilder: (context, index) {
                    return FoodCard(food: state.products![index]);
                  },
                ),
              ),
            ],
          );
        }else {
          return Text("No Products Available");
        }
      },
    );
  }
}

