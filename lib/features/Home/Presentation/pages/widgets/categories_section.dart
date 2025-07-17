import 'package:flutter/material.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/category_card.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/section_header.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  final List<CategoryItem> categories = [
    CategoryItem('All', Icons.apps, Colors.orange),
    CategoryItem('Coffee', Icons.coffee, Colors.brown),
    CategoryItem('Drink', Icons.local_drink, Colors.blue),
    CategoryItem('Fast Food', Icons.fastfood, Colors.red),
    CategoryItem('Cake', Icons.cake, Colors.pink),
    CategoryItem('Sushi', Icons.restaurant, Colors.green),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: "Popular Food Nearby"),
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryCard(category: categories[index]);
            },
          ),
        ),
      ],
    );
  }
}

class CategoryItem {
  final String name;
  final IconData icon;
  final Color color;

  CategoryItem(this.name, this.icon, this.color);
}
