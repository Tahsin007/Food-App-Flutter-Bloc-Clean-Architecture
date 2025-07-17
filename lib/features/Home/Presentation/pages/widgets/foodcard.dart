import 'package:flutter/material.dart';
import 'package:stack_food/core/theme/app_pallete.dart';
import 'package:stack_food/features/Home/Presentation/pages/widgets/popular_food.dart';

class FoodCard extends StatelessWidget {
  final FoodItem food;

  const FoodCard({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppPallete.darkGray.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: AppPallete.lightGray,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Center(
              child: Icon(
                Icons.restaurant,
                size: 40,
                color: AppPallete.darkGray,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${food.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: AppPallete.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      food.rating.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
