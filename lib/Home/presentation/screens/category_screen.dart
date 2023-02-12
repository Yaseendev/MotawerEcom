import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  const CategoryScreen({super.key,
   required this.title,
   });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          widget.title,
          style: TextStyle(
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
        leading: BackButton(
          color: AppColors.PRIMARY_COLOR,
        ),
      ),
    );
  }
}
