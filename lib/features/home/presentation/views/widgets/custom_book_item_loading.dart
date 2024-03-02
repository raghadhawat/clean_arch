import 'package:flutter/material.dart';

class CustomBookItemLoading extends StatelessWidget {
  const CustomBookItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: Colors.grey[50],
        ),
      ),
    );
  }
}
