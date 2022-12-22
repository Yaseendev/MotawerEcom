import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeItemCard extends StatelessWidget {
  const HomeItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:
                  'https://offautan-uc1.azureedge.net/-/media/images/off/ph/products-en/products-landing/landing/off_overtime_product_collections_large_2x.jpg?la=en-ph',
              width: 120,
              height: 140,
            ),
            SizedBox(height: 5),
            Text(
              'Some Product',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text('Category'),
            SizedBox(height: 5),
            Text(
              '200 EGP',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
