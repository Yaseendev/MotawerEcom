import 'package:ecommerce/Admin/presentation/widgets/product_admin_card.dart';
import 'package:ecommerce/Home/logic/categeroy_bloc/category_bloc.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Product/presentation/widgets/product_card.dart';
import '../widgets/loading/category_loading.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  const CategoryScreen({
    super.key,
    required this.title,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          widget.title,
          style: TextStyle(
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
        leading: BackButton(
          color: AppColors.PRIMARY_COLOR,
        ),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryFetched) {
            return state.products.isEmpty
                ? Center(
                    child: Text(
                      'There is no ${widget.title} products yet',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: state.products.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          (MediaQuery.of(context).size.width / 430),
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(product: state.products[index]);
                    },
                  );
          }
          return CategoryLoadingWidget();
        },
      ),
    );
  }
}
