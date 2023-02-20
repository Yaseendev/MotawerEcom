import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderProductTile extends StatelessWidget {
  const OrderProductTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(10)),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:
                  'https://m.media-amazon.com/images/I/61UY5LzzA0L._AC_UF1000,1000_QL80_.jpg',
              height: 75,
              width: 100,
              placeholder: (context, url) => Image.asset(
                'assets/images/placeholder.jpg',
                height: 75,
                width: 100,
              ),
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/placeholder.jpg',
                height: 75,
                width: 100,
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product 1',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Qty: 2',
              ),
            ],
          ),
        ),
      ],
    );
  }
}