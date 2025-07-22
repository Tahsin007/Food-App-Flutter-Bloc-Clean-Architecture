import 'package:flutter/material.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/app_search_bar.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/categories_section.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/food_campaign_section.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/menu_banner.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/popular_food.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/restaurent_section.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Column(
        children: [
          AppSearchBar(hintText: "Search food or restaurant here..."),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                MenuBannerSection(isWeb: true),
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
        ],
      ),
    );
  }
}
