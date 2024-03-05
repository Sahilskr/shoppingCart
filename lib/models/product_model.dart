class Product {
   String? id;
   String? name;
   double? price;
   double? discount;
    int? quantity;
  Product({
     this.id,
     this.name,
     this.price,
     this.discount,
    this.quantity=0,
  });

  double? get discountedPrice => (price??0) - ((price??0) * ((discount??0) / 100));

  Product.fromJson(Map<String, dynamic> json) {
      id= json['id'].toString() ;
      name=json['title'] ;
      price= (json['price'] ?? 0.0).toDouble();
      discount=(json['discountPercentage'] ?? 0.0).toDouble();
      quantity=0;
  }
}
