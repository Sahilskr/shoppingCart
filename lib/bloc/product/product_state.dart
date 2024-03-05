part of 'product_bloc.dart';


abstract class ProductState extends Equatable {
  final int quantity;
  ProductState({required this.quantity});

  @override
  List<Object?> get props => [quantity];
}

class ProductInitial extends ProductState {
  ProductInitial() : super(quantity: 0);
}


class ProductsLoaded extends ProductState {
  final List<Product> products;

  ProductsLoaded({required this.products, required int quantity}) : super(quantity: quantity);

  @override
  List<Object?> get props => [products, quantity];
}

class ProductsError extends ProductState {
  final String error;

  ProductsError({required this.error, required int quantity}) : super(quantity: quantity);

  @override
  List<Object?> get props => [error];
}


