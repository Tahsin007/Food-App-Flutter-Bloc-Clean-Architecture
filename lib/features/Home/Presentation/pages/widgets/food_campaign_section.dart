import 'package:flutter/material.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/campaign_card.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/section_header.dart';

class FoodCampaignSection extends StatefulWidget {
  const FoodCampaignSection({super.key});

  @override
  State<FoodCampaignSection> createState() => _FoodCampaignSectionState();
}

class _FoodCampaignSectionState extends State<FoodCampaignSection> {
  final List<CampaignItem> campaigns = [
    CampaignItem(
      name: 'Burger1',
      originalPrice: 12.00,
      discountedPrice: 8.00,
      rating: 4.8,
      image: 'assets/burger.jpg',
    ),
    CampaignItem(
      name: 'Burger2',
      originalPrice: 12.00,
      discountedPrice: 8.00,
      rating: 4.8,
      image: 'assets/burger.jpg',
    ),
    CampaignItem(
      name: 'Burger3',
      originalPrice: 12.00,
      discountedPrice: 8.00,
      rating: 4.8,
      image: 'assets/burger.jpg',
    ),
    CampaignItem(
      name: 'Burger4',
      originalPrice: 12.00,
      discountedPrice: 8.00,
      rating: 4.8,
      image: 'assets/burger.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Food Campaign'),
        Container(
          height: 220,
          child: ListView.builder(
            // padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: campaigns.length,
            itemBuilder: (context, index) {
              return CampaignCard(campaign: campaigns[index]);
            },
          ),
        ),
      ],
    );
  }
}
