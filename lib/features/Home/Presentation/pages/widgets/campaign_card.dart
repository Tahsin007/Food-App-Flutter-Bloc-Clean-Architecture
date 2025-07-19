import 'package:flutter/material.dart';
import 'package:stack_food/core/theme/app_pallete.dart';
import 'package:stack_food/features/Home/Domain/entities/food_campaign_entity.dart';

class CampaignCard extends StatelessWidget {
  final FoodCampaignEntity campaign;

  const CampaignCard({Key? key, required this.campaign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              campaign.imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  campaign.name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '\$${calculateDiscountedPrice(campaign.price, campaign.discount,campaign.discountType).toStringAsFixed(2)}',
                      style: TextStyle(
                        color: AppPallete.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '\$${campaign.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      campaign.avgRating.toStringAsFixed(2),
                      style: TextStyle(fontSize: 12),
                    ),
                    Spacer(),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppPallete.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 16),
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

double calculateDiscountedPrice(int actualPrice, int discountPercent, String discountType) {
  if (discountType == 'percentage') {
    return actualPrice - (actualPrice * discountPercent / 100);
  } else {
    return (actualPrice - discountPercent).toDouble();
  }
}
