import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cartabc/models/product_model.dart';
import 'package:cartabc/services/product_service.dart';

import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService productService = ProductService();

  ProductBloc() : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProducts) {
      try {
        final List<Product> products = await productService.fetchProducts();
        yield ProductsLoaded(products: products, quantity: state.quantity);
      } catch (e) {
        yield ProductsError(error: e.toString(), quantity: state.quantity);
      }
    }

  }
}
