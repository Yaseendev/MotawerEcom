import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Product/bloc/product_bloc.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Product/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchResultTile extends StatelessWidget {
  final Product product;
  const SearchResultTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => BlocProvider<ProductBloc>(
                create: (context) => ProductBloc(product),
                child: ProductDetailsScreen(
                  product: product,
                ),
              ))),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
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
                        width: 100,
                        height: 90,
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/placeholder.jpg',
                        width: 100,
                        height: 90,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 235,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: RatingBar.builder(
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (value) {},
                            itemSize: 20,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            initialRating:
                                4, //TODO: add rating to product model
                          ),
                        ),
                        Container(
                          width: 235,
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          width: 235,
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text('Eligible for FREE Shipping'),
                        ),
                        Container(
                          width: 235,
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: const Text(
                            'In Stock',
                            style: TextStyle(
                              color: Colors.teal,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
