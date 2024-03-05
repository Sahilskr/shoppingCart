part of 'addproduct_bloc.dart';

abstract class AddProductEvent extends Equatable {
  const AddProductEvent();

  @override
  List<Object?> get props => [];
}

class IncreaseQuantity extends AddProductEvent {}

class DecreaseQuantity extends AddProductEvent {}

class ResetQuantity extends AddProductEvent {}