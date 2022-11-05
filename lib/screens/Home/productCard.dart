import 'package:flutter/material.dart';

import '../../model/product_model.dart';

class productCard extends StatelessWidget {
  const productCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 100,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            product.image,
            fit: BoxFit.fitHeight,
            height: 50,
          ),
          Text(
            product.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text('RM${product.price.toString()}'),
        ],
      ),
    );
  }
}
