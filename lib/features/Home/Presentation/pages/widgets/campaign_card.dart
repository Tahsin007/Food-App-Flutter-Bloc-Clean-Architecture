import 'package:flutter/material.dart';
import 'package:stack_food/core/theme/app_pallete.dart';
import 'package:stack_food/features/Home/Domain/entities/food_campaign_entity.dart';

class CampaignCard extends StatelessWidget {
  final FoodCampaignEntity campaign;

  const CampaignCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    late String discountText;
    if (campaign.discountType == 'percent') {
      discountText = '${campaign.discount}% off';
    } else {
      discountText = '${campaign.discount}Tk off';
    }
    return Container(
      // width: 260,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Image with discount badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  campaign.imageUrl,
                  width: 90,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    discountText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          /// Product info
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    campaign.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    campaign.restaurentName.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 6),

                  /// Ratings
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: 14,
                        color: index < campaign.avgRating
                            ? Colors.green
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// Price row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '\$${calculateDiscountedPrice(campaign.price, campaign.discount, campaign.discountType)}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '\$${campaign.price.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 6),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: -10,
                right: -18,
                child: IconButton(
                  icon: const Icon(Icons.add, color: Colors.black),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${campaign.name} added to cart')),
                    );
                  },
                ),
              ),
            ],
          ),

          /// Add button
        ],
      ),
    );
  }
}

double calculateDiscountedPrice(
  int actualPrice,
  int discountPercent,
  String discountType,
) {
  if (discountType == 'percentage') {
    return actualPrice - (actualPrice * discountPercent / 100);
  } else {
    return (actualPrice - discountPercent).toDouble();
  }
}
