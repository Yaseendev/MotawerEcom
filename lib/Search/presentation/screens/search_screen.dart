import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final String? searchTerm;
  const SearchScreen({super.key,
  this.searchTerm,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Search',
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
