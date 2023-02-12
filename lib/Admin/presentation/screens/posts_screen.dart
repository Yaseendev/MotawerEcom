import 'package:ecommerce/Admin/logic/product_bloc/product_bloc.dart';
import 'package:ecommerce/Admin/logic/products_bloc/products_bloc.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/product_card.dart';
import 'add_product_screen.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsBloc, ProductsState>(
        buildWhen: (previous, current) =>
            ((previous is ProductsFetched &&
                    !(current is ProductsError ||
                        current is ProductsNoInternet)) ||
                current is ProductsFetched ||
                current is ProductsLoading) &&
            !(current is ProductsDeleting),
        builder: (context, state) {
          if (state is ProductsFetched) {
            return state.products.isNotEmpty
                ? GridView.builder(
                    itemCount: state.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ProductCard(product: state.products[index]);
                    },
                  )
                : Center(
                    child: Text(
                      'You don\'t have any product',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  );
          }
          return const Center(
            child: Text('Products'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: AppColors.PRIMARY_COLOR,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (ctx) => BlocProvider<ProductBloc>(
                        create: (context) => ProductBloc(),
                        child: AddProductScreen(),
                      )))
              .then((product) {
            if (product != null) {
              Fluttertoast.showToast(
                msg: 'Your product has been listed for sell',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                //backgroundColor: Colors.red,
                //textColor: Colors.white,
                fontSize: 16.0,
              );
            }
          });
        },
        backgroundColor: Colors.white,
      ),
    );
  }
}
