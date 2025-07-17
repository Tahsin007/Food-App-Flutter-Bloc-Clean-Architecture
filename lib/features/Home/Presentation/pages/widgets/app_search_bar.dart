import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  const AppSearchBar({super.key, required this.hintText, this.onChanged, this.onSubmitted, this.controller});

  @override
  Widget build(BuildContext context) {
      return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        controller: controller ?? TextEditingController(),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}