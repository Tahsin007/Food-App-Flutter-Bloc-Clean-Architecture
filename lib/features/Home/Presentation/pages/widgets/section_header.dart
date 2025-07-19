import 'package:flutter/material.dart';
import 'package:stack_food/core/theme/app_pallete.dart';
import 'package:stack_food/core/theme/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onTextBtnPressed;
  SectionHeader({super.key, required this.title,this.onTextBtnPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: AppTextStyle.h3.copyWith(
          color: AppPallete.black
        ),)),
        TextButton(onPressed: onTextBtnPressed,child: Text("View All",style: AppTextStyle.bodyMedium.copyWith(
          color:AppPallete.primaryColor,
          fontWeight: FontWeight.w500
        ),))
      ],
    );
  }
}