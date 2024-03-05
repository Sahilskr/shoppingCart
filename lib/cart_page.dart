import 'package:cartabc/bloc/cart/cart_bloc.dart';
import 'package:cartabc/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            return CartSummary(cartItems: state.cartItems);
          } else if (state is CartError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text("Cart is Empty"));
          }
        },
      ),
    );
  }
}

class CartSummary extends StatelessWidget {
  final List<CartItem> cartItems;

  CartSummary({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartItems[index];
              return ListTile(
                title: Text(cartItem.product.name??"",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                subtitle: Text('${cartItem.product.discountedPrice?.toStringAsFixed(2)} x ${cartItem.quantity}'),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5,bottom: 32,left: 16,right: 16),
          child: Column(
            children: [
              Divider(),
              Text('Total Price: \$ ${calculateTotalPrice().toStringAsFixed(2)}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ],
    );
  }

  double calculateTotalPrice() {
    return cartItems.fold(0.0, (total, item) => total + ((item.product.discountedPrice??0) * item.quantity));
  }
}
