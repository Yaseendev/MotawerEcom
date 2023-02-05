import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';

class AddressBox extends StatelessWidget implements PreferredSizeWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 10),
      color: Colors.grey[200],
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            size: 20,
            color: AppColors.PRIMARY_COLOR, //Colors.white,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Deliver to ',
                style: TextStyle(
                  color: AppColors.PRIMARY_COLOR, //Colors.white,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5, top: 2, right: 5),
            child: Icon(
              Icons.arrow_drop_down,
              color: AppColors.PRIMARY_COLOR,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}
