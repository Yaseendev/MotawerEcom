import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../screens/order_details_screen.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListTile(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => OrderDetailsScreen())),
          isThreeLine: true,
          horizontalTitleGap: 0,
          leading: Icon(
            Icons.list_alt,
          ),
          title: Text(
            '${intl.DateFormat.yMMMEd().format(DateTime.now())} ${intl.DateFormat.jm().format(DateTime.now())}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(
                'X10 Items',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '${intl.NumberFormat.simpleCurrency(name: 'EGP').format(10000)}',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          trailing: Text(
            'Pending',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
      // Column(
      //   children: [

      // ],
      // ),
    );
  }
}
