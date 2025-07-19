import 'package:flutter/material.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/categories_section.dart';

class CategoryCard extends StatelessWidget {
  String? name;
  String? imageUrl;

  CategoryCard({Key? key, this.name, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Image.network(
            imageUrl ?? 'https://via.placeholder.com/70',
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            name ?? 'Unknown',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
