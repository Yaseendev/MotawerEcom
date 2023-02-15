import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  final List<Product> tempProducts; //TODO: Remove and fetch from server
  const CartScreen({super.key,
  required this.tempProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Your Cart',
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
          ...ListTile.divideTiles(
            context: context,
            tiles: tempProducts.map((e) => CartItemCard(product:e))),
          // ...state.map((p) => OrderReviewCard(
          //       order: p,
          //     )),
        ],
      ),
    );
  }
}
