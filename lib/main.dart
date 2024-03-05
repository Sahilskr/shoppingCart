import 'dart:developer';

import 'package:cartabc/bloc/addProduct/addproduct_bloc.dart';
import 'package:cartabc/bloc/cart/cart_bloc.dart';
import 'package:cartabc/bloc/product/product_bloc.dart';
import 'package:cartabc/cart_page.dart';
import 'package:cartabc/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc()..add(FetchProducts()),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        BlocProvider<AddProductBloc>(
          create: (context) => AddProductBloc(),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        home: MyHomePage(),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        actions: [
          _buildCartIconWithBadge(context),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return ProductList(products: state.products);
          } else if (state is ProductsError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }


  Widget _buildCartIconWithBadge(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        log("cart updated==${state.props}");
        int itemCount = 0;
        if(state is CartLoaded){
          for(var i in state.cartItems){
            itemCount+=i.quantity;
          }
        }
        return
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            badgeAnimation: badges.BadgeAnimation.slide(
            ),
            showBadge: itemCount>0,
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.red,
            ),
            badgeContent: Text(itemCount.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(icon: Icon(Icons.shopping_cart),
                onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CartPage()),
              );
            }),
          );

      },
    );
  }

}


