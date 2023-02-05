import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';

class AccountScreenItems extends StatelessWidget {
  const AccountScreenItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.settings_rounded,
                color: Colors.white,
              ),
              backgroundColor: AppColors.PRIMARY_COLOR,
            ),
            title: Text('Settings'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            //onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SettingsScreen())),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.privacy_tip_rounded,
                color: Colors.white,
              ),
              backgroundColor: AppColors.PRIMARY_COLOR,
            ),
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ]).toList(),
      ),
    );
  }
}