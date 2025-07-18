import 'package:flutter/material.dart';
import 'package:stack_food/core/theme/app_pallete.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/app_search_bar.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/banner_section.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/bottom_nav.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/categories_section.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/food_campaign_section.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/menu_banner.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/popular_food.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/restaurent_section.dart';

class StackFoodHome extends StatefulWidget {
  const StackFoodHome({super.key});

  @override
  State<StackFoodHome> createState() => _StackFoodHomeState();
}

class _StackFoodHomeState extends State<StackFoodHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.lightGray,
      appBar: _buildAppBar(),
      bottomNavigationBar: const AppBottomNav(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppSearchBar(hintText: "Search food or restaurant here..."),
              SizedBox(height: 20),
              MenuBannerSection(),
              SizedBox(height: 20),
              CategoriesSection(),
              SizedBox(height: 20),
              PopularFoodSection(),
              SizedBox(height: 30),
              FoodCampaignSection(),
              SizedBox(height: 20),
              RestaurentSection(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppPallete.backgroundColor,
      elevation: 0,
      leading: Icon(Icons.location_on, color: AppPallete.darkGray),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Location',
            style: TextStyle(color: AppPallete.darkGray, fontSize: 12),
          ),
          Text(
            'New York, NY',
            style: TextStyle(
              color: AppPallete.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        Icon(Icons.notifications_outlined, color: AppPallete.black),
        SizedBox(width: 16),
      ],
    );
  }
}
