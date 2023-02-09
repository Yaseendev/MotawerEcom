import 'package:ecommerce/Admin/logic/product_bloc/product_bloc.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'add_product_screen.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Products'),
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
