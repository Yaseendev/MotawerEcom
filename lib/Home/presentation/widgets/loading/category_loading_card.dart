import 'package:flutter/material.dart';

class CategoryLoadingCard extends StatelessWidget {
  const CategoryLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
