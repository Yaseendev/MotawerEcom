import 'package:flutter/material.dart';

import 'deal_0f_day_card.dart';

class DealOfTheDaySection extends StatelessWidget {
  const DealOfTheDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Deal Of The Day',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DealOfTheDayCard(),
      ],
    );
  }
}
