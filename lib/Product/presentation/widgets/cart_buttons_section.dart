import 'package:flutter/material.dart';

class CartButtonsSection extends StatelessWidget {
  final VoidCallback onPress;
  const CartButtonsSection({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 35,
      type: MaterialType.card,
      borderOnForeground: true,
      shadowColor: Colors.black,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text('Buy Now'),
              ),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Icon(Icons.add_shopping_cart_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
