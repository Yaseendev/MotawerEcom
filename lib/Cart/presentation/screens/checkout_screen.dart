import 'package:cool_alert/cool_alert.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/paywith_listview.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentMethod selectedMethod = PaymentMethod.cash;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Checkout',
          style: TextStyle(
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
        leading: BackButton(
          color: AppColors.PRIMARY_COLOR,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .16,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: const LatLng(30.0504132, 31.2073222),
                          zoom: 18,
                        ),
                        liteModeEnabled: true,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_pin_circle_outlined),
                      title: Text('Address'),
                      subtitle: Text('Your Address'),
                      trailing: TextButton(
                        child: Text('Change'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.truckFast,
                    color: Colors.black,
                  ),
                  title: Text('Within 3 hours'),
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          Text(
            'Pay with',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          PaywithView(
            onSelect: (method) {
              setState(() {
                selectedMethod = method;
              });
            },
          ),
          SizedBox(height: 18),
          Text(
            'Payment Summary',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sub-total',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '1000 EGP',
                      //'${order.fold(0, (num previousValue, element) => previousValue + element.totalPrice)} EGP',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fees',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '4.99 EGP',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '1004.99 EGP',
                      //'${(order.fold(0, (num previousValue, element) => previousValue + element.totalPrice) + 4.99).toStringAsFixed(2)} EGP',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        //TODO: Implement with backend
                        Navigator.of(context).popUntil(
                            (route) => route.settings.name == '/primary');
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                          title: 'Order Placed',
                          text: 'Your order is on the way',
                          animType: CoolAlertAnimType.slideInUp,
                          backgroundColor: Colors.transparent,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Place Order',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
