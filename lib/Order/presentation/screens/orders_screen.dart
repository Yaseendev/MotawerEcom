import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'My Orders',
          style: TextStyle(
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
        leading: BackButton(
          color: AppColors.PRIMARY_COLOR,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          OrderCard(),
          OrderCard(),
          OrderCard(),
        ],
      ),
    );
  }
}