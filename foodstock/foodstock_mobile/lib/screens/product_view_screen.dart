import 'package:flutter/material.dart';
import 'package:foodstock_mobile/services/api_service.dart';
import 'package:foodstock_mobile/models/product.dart';
import 'package:foodstock_mobile/models/category.dart';
import 'package:foodstock_mobile/models/producent.dart';
import 'package:foodstock_mobile/models/supplier.dart';
import 'package:foodstock_mobile/models/user.dart';

class ProductViewScreen extends StatefulWidget {
  final String productId;

  const ProductViewScreen({required this.productId, super.key});

  @override
  _ProductViewScreenState createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  late Product product;
  late List<Category> categories;
  late List<Producent> producents;
  late List<Supplier> suppliers;
  late User user;

  bool isEditing = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      product = await ApiService().getProductById(widget.productId);
      categories = await ApiService().getCategories();
      producents = await ApiService().getProducents();
      suppliers = await ApiService().getSuppliers();
      user = await ApiService().getUser('800ff2de-c9a2-4c5d-a90b-c585728a13ff');
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveChanges() async {
    try {
      await ApiService().updateProduct(product);
    } catch (e) {
      throw Exception("Failed save changes");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Product Details'),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, 'refresh');
              })),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.shopping_bag_outlined),
                        title: isEditing
                            ? TextField(
                                controller:
                                    TextEditingController(text: product.name),
                                onChanged: (value) {
                                  product.name = value;
                                },
                                decoration: const InputDecoration(
                                    labelText: 'Product Name'),
                              )
                            : Text(product.name),
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.format_list_numbered_outlined),
                        title: isEditing
                            ? TextField(
                                keyboardType: TextInputType.number,
                                controller: TextEditingController(
                                    text: product.quantity.toString()),
                                onChanged: (value) {
                                  product.quantity = int.parse(value);
                                },
                                decoration: const InputDecoration(
                                    labelText: 'Quantity'),
                              )
                            : Text("${product.quantity}"),
                      ),
                      ListTile(
                        leading: const Icon(Icons.calendar_today),
                        title:
                            Text("Expiration Date: ${product.expirationDate}"),
                        trailing: isEditing
                            ? IconButton(
                                icon: const Icon(Icons.edit_calendar),
                                onPressed: () async {
                                  DateTime initialDate = DateTime.tryParse(
                                          product.expirationDate) ??
                                      DateTime.now();
                                  final DateTime? pickedDate =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: initialDate,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );

                                  setState(
                                    () {
                                      product.expirationDate =
                                          "$pickedDate".split(' ')[0];
                                    },
                                  );
                                },
                              )
                            : null,
                      ),
                      ListTile(
                        leading: const Icon(Icons.category_outlined),
                        title: isEditing
                            ? DropdownButton<String>(
                                value: product.categoryId,
                                items: categories.map((Category category) {
                                  return DropdownMenuItem<String>(
                                    value: category.id,
                                    child: Text(category.categoryName),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    product.categoryId = newValue;
                                  });
                                },
                              )
                            : Text(categories
                                .firstWhere((category) =>
                                    category.id == product.categoryId)
                                .categoryName),
                      ),
                      ListTile(
                        leading: const Icon(Icons.business),
                        title: isEditing
                            ? DropdownButton<String>(
                                value: product.producentId.toString(),
                                items: producents.map((Producent producent) {
                                  return DropdownMenuItem<String>(
                                    value: producent.id.toString(),
                                    child: Text(producent.name),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    product.producentId = newValue;
                                  });
                                },
                              )
                            : Text(producents
                                .firstWhere((producent) =>
                                    producent.id == product.producentId)
                                .name),
                      ),
                      ListTile(
                        leading: const Icon(Icons.qr_code),
                        title: isEditing
                            ? TextField(
                                keyboardType: TextInputType.number,
                                controller: TextEditingController(
                                    text: product.barCode),
                                onChanged: (value) {
                                  product.barCode = value;
                                },
                                decoration: const InputDecoration(
                                    labelText: 'Bar Code'),
                              )
                            : Text(product.barCode),
                      ),
                      ListTile(
                        leading: const Icon(Icons.local_shipping_outlined),
                        title: isEditing
                            ? DropdownButton<String>(
                                value: product.supplierId.toString(),
                                items: suppliers.map((Supplier supplier) {
                                  return DropdownMenuItem<String>(
                                    value: supplier.id.toString(),
                                    child: Text(supplier.name),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    product.supplierId = newValue;
                                  });
                                },
                              )
                            : Text(suppliers
                                .firstWhere((supplier) =>
                                    supplier.id == product.supplierId)
                                .name),
                      ),
                      ListTile(
                        leading: const Icon(Icons.calendar_today),
                        title: Text("Delivery Date: ${product.deliveryDate}"),
                        trailing: isEditing
                            ? IconButton(
                                icon: const Icon(Icons.edit_calendar),
                                onPressed: () async {
                                  DateTime initialDate =
                                      DateTime.tryParse(product.deliveryDate) ??
                                          DateTime.now();
                                  final DateTime? pickedDate =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: initialDate,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );

                                  setState(() {
                                    product.deliveryDate =
                                        "$pickedDate".split(' ')[0];
                                  });
                                },
                              )
                            : null,
                      ),
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: Text("${user.firstName} ${user.surname}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            if (isEditing) {
                              bool confirm = await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Confirm'),
                                      content: const Text(
                                          'Do you want to save all changes?'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Cancel'),
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                        ),
                                        TextButton(
                                          child: const Text('Yes'),
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                        ),
                                      ],
                                    ),
                                  ) ??
                                  false;

                              if (confirm) {
                                await saveChanges();
                              }
                            }

                            setState(() {
                              isEditing = !isEditing;
                            });
                          },
                          icon: Icon(isEditing ? Icons.save : Icons.edit),
                          label: Text(isEditing ? "Save" : "Edit"),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, 'refresh');
                        },
                        child: const Text("Back to Products"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
