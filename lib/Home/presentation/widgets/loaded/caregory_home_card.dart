import 'package:ecommerce/Home/presentation/screens/category_screen.dart';
import 'package:flutter/material.dart';

class CategoryHomeCard extends StatelessWidget {
  const CategoryHomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => CategoryScreen(
          title: 'Test'
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
