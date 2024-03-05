import 'package:cartabc/models/product_model.dart';
import 'package:cartabc/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  final List<Product> products;

  ProductList({required this.products});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          final product = widget.products[index];
          return ProductCArd(product: product);
        },
      ),
    );
  }
}