import 'package:ecommerce/Order/presentation/screens/orders_screen.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';

class UserInfoItems extends StatelessWidget {
  const UserInfoItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                backgroundColor: AppColors.PRIMARY_COLOR,
              ),
              title: Text('Edit Account'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              //onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SettingsScreen())),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.inventory_rounded,
                  color: Colors.white,
                ),
                backgroundColor: AppColors.PRIMARY_COLOR,
              ),
              title: Text('My Orders'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => OrdersScreen())),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                ),
                backgroundColor: AppColors.PRIMARY_COLOR,
              ),
              title: Text('Favorites'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              //onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SettingsScreen())),
            ),
          ],
        ).toList(),
      ),
    );
  }
}
