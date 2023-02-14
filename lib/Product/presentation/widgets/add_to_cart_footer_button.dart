import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback onPress;
  const AddToCartButton({
  super.key,
  required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
     onPressed: (){},
     child: Text('Add to cart'),);
  }
}