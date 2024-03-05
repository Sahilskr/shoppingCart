import 'dart:convert';
import 'dart:developer';
import 'package:cartabc/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      Map resp= json.decode(response.body);
      List v=resp['products'];
      return v.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
