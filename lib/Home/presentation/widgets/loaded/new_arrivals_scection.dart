import 'package:flutter/material.dart';

import 'home_item_card.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({Key? key}) : super(key: key);

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
          HomeItemCard(),
          HomeItemCard(),
          HomeItemCard(),
        ],
      ),
    );
  }
}