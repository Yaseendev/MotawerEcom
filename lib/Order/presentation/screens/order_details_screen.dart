import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../widgets/order_product_tile.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Order Details',
          style: TextStyle(
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
        leading: BackButton(
          color: AppColors.PRIMARY_COLOR,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Order Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Date:    ${intl.DateFormat().format(
                    DateTime.now(),
                  )}'),
                  Text('Order ID:         widget.order.id'),
                  Text('Order Total:    \$widget.order.totalPrice'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Purchase Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OrderProductTile(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tracking',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Stepper(
                currentStep: currentStep,
                controlsBuilder: (context, details) {
                  // if (user.type == 'admin') {
                  //   return CustomButton(
                  //     text: 'Done',
                  //     onTap: () => changeOrderStatus(details.currentStep),
                  //   );
                  // }
                  return Container();
                },
                steps: [
                  Step(
                    title: const Text('Pending'),
                    content: const Text(
                      'Your order is yet to be delivered',
                    ),
                    isActive: currentStep >= 0,
                    state: currentStep > 0
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Completed'),
                    content: const Text(
                      'Your order has been delivered, you are yet to sign.',
                    ),
                    isActive: currentStep >= 1,
                    state: currentStep <= 1
                        ? StepState.indexed
                        : StepState.complete,
                  ),
                  Step(
                    title: const Text('Received'),
                    content: const Text(
                      'Your order has been delivered and signed by you.',
                    ),
                    isActive: currentStep >= 2,
                    state: currentStep <= 2
                        ? StepState.indexed
                        : StepState.complete,
                  ),
                  Step(
                    title: const Text('Delivered'),
                    content: const Text(
                      'Your order has been delivered and signed by you!',
                    ),
                    isActive: currentStep == 3,
                    state: currentStep == 3
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
