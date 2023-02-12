import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Admin/logic/products_bloc/products_bloc.dart';
import 'package:ecommerce/Shared/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return Column(
            children: [
              state is ProductsDeleting && state.productToDelete == product.id
                  ? Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          'Deleteing...',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: product.images.first,
                        width: double.maxFinite,
                        height: 140,
                        placeholder: (context, url) => Image.asset(
                          'assets/images/placeholder.jpg',
                          width: double.maxFinite,
                          height: 140,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/images/placeholder.jpg',
                          width: double.maxFinite,
                          height: 140,
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: state is ProductsDeleting
                          ? null
                          : () {
                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    title: Text('Delete Product'),
                                    content: Text(
                                        'Are you sure you want to delete ${product.name}?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          context.read<ProductsBloc>().add(
                                              DeleteAProduct(product.id ?? ''));
                                          Navigator.pop(ctx);
                                        },
                                        child: Text('Yes'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(ctx);
                                        },
                                        child: Text('No'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                      icon: Icon(Icons.delete_forever_rounded),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
