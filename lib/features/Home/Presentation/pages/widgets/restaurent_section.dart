import 'package:flutter/material.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/restaurent_card.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/section_header.dart';

class RestaurentSection extends StatefulWidget {
  const RestaurentSection({super.key});

  @override
  State<RestaurentSection> createState() => _RestaurentSectionState();
}

class _RestaurentSectionState extends State<RestaurentSection> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Restaurants'),
        ListView.builder(
          // padding: EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return RestaurantCard(restaurant: restaurants[index]);
          },
        ),
      ],
    );
  }
}
