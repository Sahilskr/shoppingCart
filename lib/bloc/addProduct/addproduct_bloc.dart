import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';


import 'package:equatable/equatable.dart';

part 'addproduct_event.dart';
part 'addproduct_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {

  AddProductBloc() : super(ProductInitial());

  @override
  Stream<AddProductState> mapEventToState(AddProductEvent event) async* {

    if (event is IncreaseQuantity) {
      yield ProductPageLoaded(quantity: state.quantity + 1);
    } else if (event is DecreaseQuantity && state.quantity >= 1) {
      yield ProductPageLoaded(quantity: state.quantity - 1);
    }
    else if (event is ResetQuantity) {
      yield ProductPageLoaded(quantity: 0);
    }
  }
}
