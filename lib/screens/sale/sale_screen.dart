import 'package:flutter/material.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sale Screen',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
