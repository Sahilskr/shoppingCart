
import 'package:cartabc/models/product_model.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});
}

class Cart {
  List<CartItem> items = [];

  double get totalPrice {
    return items.fold(0.0, (total, item) => total + ((item.product.discountedPrice??0) * item.quantity));
  }
}
