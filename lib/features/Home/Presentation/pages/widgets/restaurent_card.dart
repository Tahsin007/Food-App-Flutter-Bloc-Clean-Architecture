import 'package:flutter/material.dart';
import 'package:stack_food/core/theme/app_pallete.dart';
import 'package:stack_food/features/Home/Domain/entities/restaurent_entity.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurentEntity restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppPallete.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppPallete.darkGray.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                restaurant.imageUrl,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      restaurant.avgRating.toStringAsFixed(2),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.access_time,
                      color: AppPallete.darkGray,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      restaurant.deliveryTime,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppPallete.darkGray,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  'Delivery fee: \$${restaurant.deliveryFee}',
                  style: TextStyle(fontSize: 14, color: AppPallete.darkGray),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantItem {
  final String name;
  final double rating;
  final String deliveryTime;
  final double deliveryFee;
  final String image;

  RestaurantItem({
    required this.name,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.image,
  });
}
