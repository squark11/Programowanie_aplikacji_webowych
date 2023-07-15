import 'package:foodstock_mobile/models/product.dart';

class Producent {
  final String id;
  final String name;
  final List<Product>? products;

  Producent({
    required this.id,
    required this.name,
    this.products,
  });

  // JSON
  factory Producent.fromJson(Map<String, dynamic> json) {
    var productsJson = json['products'] as List?;
    List<Product>? productsList =
        productsJson?.map((product) => Product.fromJson(product)).toList();

    return Producent(
      id: json['id'],
      name: json['name'],
      products: productsList,
    );
  }
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> products =
        this.products!.map((product) => product.toJson()).toList();

    return {
      'id': id,
      'name': name,
      'products': products,
    };
  }
}
