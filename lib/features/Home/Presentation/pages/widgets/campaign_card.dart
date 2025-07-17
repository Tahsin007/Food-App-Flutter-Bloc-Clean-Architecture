import 'package:flutter/material.dart';
import 'package:stack_food/core/theme/app_pallete.dart';

class CampaignCard extends StatelessWidget {
  final CampaignItem campaign;

  const CampaignCard({Key? key, required this.campaign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
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
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: AppPallete.lightGray,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Center(
              child: Icon(Icons.fastfood, size: 50, color: AppPallete.darkGray),
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
                      '\$${campaign.discountedPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: AppPallete.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '\$${campaign.originalPrice.toStringAsFixed(2)}',
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
                      campaign.rating.toString(),
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

class CampaignItem {
  final String name;
  final double originalPrice;
  final double discountedPrice;
  final double rating;
  final String image;

  CampaignItem({
    required this.name,
    required this.originalPrice,
    required this.discountedPrice,
    required this.rating,
    required this.image,
  });
}
