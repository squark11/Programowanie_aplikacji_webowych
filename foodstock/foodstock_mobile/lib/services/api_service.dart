import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:foodstock_mobile/models/product.dart';
import 'package:foodstock_mobile/models/category.dart';
import 'package:foodstock_mobile/models/producent.dart';
import 'package:foodstock_mobile/models/supplier.dart';
import 'package:foodstock_mobile/models/user.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ApiService {
  late String _baseUrl;

  ApiService() {
    if (kIsWeb) {
      _baseUrl = "http://localhost/api";
    } else {
      if (Platform.isAndroid) {
        _baseUrl = "http://10.0.2.2/api";
      } else if (Platform.isIOS || Platform.isWindows) {
        _baseUrl = "http://localhost/api";
      }
    }
  }

// Methods to get, add, edit and delete product
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<bool> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/products'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(product.toJson()),
    );

    return response.statusCode == 201;
  }

  Future<Product> getProductById(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  Future<bool> updateProduct(Product product) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/products/${product.id}'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(product.toJsonPut()),
    );

    if (response.statusCode == 204) {
      return true;
    } else {
      throw Exception('Failed to update product');
    }
  }

  Future<bool> deleteProduct(String id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/products/$id'));

    return response.statusCode == 204;
  }

// Methods to get, add, edit and delete category
  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/categories'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((category) => Category.fromJson(category)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<bool> addCategory(Category category) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/categories'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(category.toJson()),
    );
    return response.statusCode == 201;
  }

  Future<bool> editCategory(String id, Category category) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/categories/$id'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(category.toJson()),
    );
    return response.statusCode == 200;
  }

  Future<bool> deleteCategory(String id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/categories/$id'));
    return response.statusCode == 200;
  }

// Method to get producent list
  Future<List<Producent>> getProducents() async {
    final response = await http.get(Uri.parse('$_baseUrl/producents'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((producent) => Producent.fromJson(producent)).toList();
    } else {
      throw Exception('Failed to load producents');
    }
  }

// Method to get supplier list
  Future<List<Supplier>> getSuppliers() async {
    final response = await http.get(Uri.parse('$_baseUrl/suppliers'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((supplier) => Supplier.fromJson(supplier)).toList();
    } else {
      throw Exception('Failed to load suppliers');
    }
  }

// Method to getUser info
  Future<User> getUser(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/users/$id'));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
