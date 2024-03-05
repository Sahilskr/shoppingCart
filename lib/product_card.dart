import 'package:cartabc/bloc/addProduct/addproduct_bloc.dart';
import 'package:cartabc/bloc/cart/cart_bloc.dart';
import 'package:cartabc/bloc/product/product_bloc.dart';
import 'package:cartabc/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductCArd extends StatelessWidget {
  final Product product;
  final addProductBloc = AddProductBloc();

  ProductCArd({required this.product});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${product.name}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          Text('Price: \$${product.price}'),
          Text('Discounted Price: \$${product.discountedPrice?.toStringAsFixed(2)}'),
          SizedBox(height: 5),
          _buildQuantitySelector(context),
          ElevatedButton(
            onPressed: () {
              _addToCart(context);
            },
            child: Text('Add to Cart'),
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _buildQuantitySelector(BuildContext context) {
    return Row(
      children: [
        Text('Quantity: '),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            addProductBloc.add(DecreaseQuantity());
          },
        ),
        BlocBuilder<AddProductBloc, AddProductState>(
          bloc: addProductBloc,
          builder: (context, state) {
            return Text(state.quantity.toString());
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            addProductBloc.add(IncreaseQuantity());
          },
        ),
      ],
    );
  }

  void _addToCart(BuildContext context) {
    final quantity = addProductBloc.state.quantity;
    if(quantity>0) {
      context.read<CartBloc>().add(
          AddToCart(product: product, quantity: quantity));
      addProductBloc.add(ResetQuantity());

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Added to Cart: ${product.name} x $quantity',),duration: Duration(milliseconds: 800),
      ));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please select quantity for ${product.name} ',),duration: Duration(milliseconds: 800),
      ));
    }
  }
}
