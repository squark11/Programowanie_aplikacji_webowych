import 'package:foodstock_mobile/models/product.dart';

class User {
  final String id;
  final String email;
  final String password;
  final String firstName;
  final String surname;
  final String roleId;
  final List<Product>? products;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.firstName,
    required this.surname,
    required this.roleId,
    this.products,
  });

  // JSON
  factory User.fromJson(Map<String, dynamic> json) {
    var productsJson = json['products'] as List?;
    List<Product>? productsList =
        productsJson?.map((product) => Product.fromJson(product)).toList();

    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
      surname: json['surname'],
      roleId: json['roleId'],
      products: productsList,
    );
  }
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> products =
        this.products!.map((product) => product.toJson()).toList();

    return {
      'id': id,
      'email': email,
      'password': password,
      'firstName': firstName,
      'surname': surname,
      'roleId': roleId,
      'products': products,
    };
  }
}
