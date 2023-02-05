import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';

class DealOfTheDayCard extends StatelessWidget {
  const DealOfTheDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://m.media-amazon.com/images/I/61UY5LzzA0L._AC_UF1000,1000_QL80_.jpg',
                alignment: Alignment.center,
                height: 180,
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/placeholder.jpg',
                  height: 180,
                ),
                fit: BoxFit.fill,
                placeholder: (context, url) => Image.asset(
                  'assets/images/placeholder.jpg',
                  height: 180,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Apple Macbook Pro M2',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: '70,000.00',
                  style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                  children: [
                    TextSpan(
                      text: '   67,000.00 EGP',
                      style: TextStyle(
                        color: AppColors.PRIMARY_COLOR,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
