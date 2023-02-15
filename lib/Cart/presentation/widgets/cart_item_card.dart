import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  const CartItemCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: product.images.first,
              width: 100,
              height: 90,
              placeholder: (context, url) => Image.asset(
                'assets/images/placeholder.jpg',
                width: 200,
                height: 140,
              ),
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/placeholder.jpg',
                width: 200,
                height: 140,
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(product.name),
              subtitle: Text('${product.price} EGP'),
              trailing: SizedBox(
                width: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 35,
                            height: 32,
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove),
                              alignment: Alignment.center,
                              iconSize: 18,
                              padding: EdgeInsets.zero,
                              style: IconButton.styleFrom(
                                alignment: Alignment.center,
                                iconSize: 18,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
