import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/cart_item_card.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  final List<Product> tempProducts; //TODO: Remove and fetch from server
  const CartScreen({
    super.key,
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
              tiles: tempProducts.map((e) => CartItemCard(product: e))),
          // ...state.map((p) => OrderReviewCard(
          //       order: p,
          //     )),
        ],
      ),
      bottomSheet: SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text.rich(TextSpan(
                text: 'Total: ',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: tempProducts
                            .fold(
                                0,
                                (previousValue, element) =>
                                    (previousValue as num) +
                                    (element.price * element.quantity))
                            .toString() +
                        ' EGP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )),
              SizedBox(height: 8),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => CheckoutScreen()));
                    },
                    child: const Text(
                      'Procceed to check out',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
