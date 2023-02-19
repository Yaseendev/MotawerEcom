import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'caregory_home_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // padding: const EdgeInsets.symmetric(horizontal: 14),
        // scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        children: [
          CategoryHomeCard(),
          CategoryHomeCard(),
          CategoryHomeCard(),
        ],
      ),
    );
  }
}
