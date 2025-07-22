import 'package:flutter/material.dart';
import 'package:stack_food/core/theme/app_pallete.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomAppBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      color: AppPallete.white,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIcon(Icons.home, 'Home', 0),
            _buildIcon(Icons.favorite_outline, 'Favorites', 1),
            const SizedBox(width: 40), // space for FAB
            _buildIcon(Icons.receipt_long, 'Orders', 2),
            _buildIcon(Icons.menu, 'Menu', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppPallete.primaryColor : AppPallete.darkGray,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? AppPallete.primaryColor : AppPallete.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
