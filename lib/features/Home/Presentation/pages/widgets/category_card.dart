import 'package:flutter/material.dart';


class CategoryCard extends StatelessWidget {
  final String? name;
  final String? imageUrl;

  const CategoryCard({super.key, this.name, this.imageUrl});

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
