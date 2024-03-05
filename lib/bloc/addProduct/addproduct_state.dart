part of 'addproduct_bloc.dart';


abstract class AddProductState extends Equatable {
   int quantity;
  AddProductState({required this.quantity});

  @override
  List<Object?> get props => [quantity];
}

class ProductInitial extends AddProductState {
  ProductInitial() : super(quantity: 0);
}

class ProductPageLoaded extends AddProductState {
  ProductPageLoaded({required int quantity}) : super(quantity: quantity);
}






