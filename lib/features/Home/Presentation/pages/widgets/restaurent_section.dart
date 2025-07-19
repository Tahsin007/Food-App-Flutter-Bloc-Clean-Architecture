import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_bloc.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_event.dart';
import 'package:stack_food/features/Home/Presentation/bloc/home_state.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/restaurent_card.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/section_header.dart';

class RestaurentSection extends StatefulWidget {
  const RestaurentSection({super.key});

  @override
  State<RestaurentSection> createState() => _RestaurentSectionState();
}

class _RestaurentSectionState extends State<RestaurentSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(FetchRestaurents());
  }

  final List<RestaurantItem> restaurants = [
    RestaurantItem(
      name: 'Pizza Palace',
      rating: 4.5,
      deliveryTime: '30-45 min',
      deliveryFee: 2.99,
      image: 'assets/restaurant1.jpg',
    ),
    RestaurantItem(
      name: 'Burger House',
      rating: 4.2,
      deliveryTime: '25-35 min',
      deliveryFee: 1.99,
      image: 'assets/restaurant2.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      
      builder: (context, state) {
        if (state.isLoadingRestaurents) {
          return Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        } else if (state.restaurents == null) {
          return Center(child: Text("No restaurants available"));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(title: 'Restaurants'),
            ListView.builder(
              // padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.restaurents!.length,
              itemBuilder: (context, index) {
                return RestaurantCard(restaurant: state.restaurents![index]);
              },
            ),
          ],
        );
      },
    );
  }
}
