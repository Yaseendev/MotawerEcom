import 'package:ecommerce/Home/presentation/logic/categeroy_bloc/category_bloc.dart';
import 'package:ecommerce/Home/presentation/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryHomeCard extends StatelessWidget {
  const CategoryHomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => BlocProvider<CategoryBloc>(
            create: (context) => CategoryBloc()..add(FetchCategory(categoryName: 'Mobiles')), //FIXME: to be changed later
                  child: CategoryScreen(title: 'Test'),
                ))),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                Icons.ice_skating,
                color: Colors.white,
                size: 26,
              ),
              radius: 25,
            ),
            SizedBox(height: 5),
            Text('Test'),
          ],
        ),
      ),
    );
  }
}
