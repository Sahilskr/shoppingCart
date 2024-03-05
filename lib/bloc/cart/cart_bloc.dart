import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cartabc/models/cart_model.dart';
import 'package:cartabc/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Cart _cart = Cart();

  CartBloc() : super(CartInitial());

  @override
  Stream<CartState> mapEventToState(
      CartEvent event,
      ) async* {
    if (event is AddToCart) {
      try {
        _cart.items.add(CartItem(product: event.product, quantity: event.quantity));
        yield CartLoaded(List.from(_cart.items));
      } catch (e) {
        yield CartError(e.toString());
      }
    }

  }
}
