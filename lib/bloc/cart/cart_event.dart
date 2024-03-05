part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddToCart extends CartEvent {
  final Product product;
  final int quantity;

  AddToCart({required this.product, required this.quantity});

  @override
  List<Object?> get props => [product, quantity];
}

