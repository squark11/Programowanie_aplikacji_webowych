import 'package:flutter/material.dart';
import 'package:foodstock_mobile/services/api_service.dart';
import 'package:foodstock_mobile/models/product.dart';
import 'package:foodstock_mobile/models/category.dart';
import 'package:foodstock_mobile/models/producent.dart';
import 'package:foodstock_mobile/models/supplier.dart';
import 'package:foodstock_mobile/utils/validators.dart';
import 'package:foodstock_mobile/screens/products_screen.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  Category? _selectedCategory;
  Producent? _selectedProducent;
  Supplier? _selectedSupplier;
  DateTime? _expirationDate;
  String _quantity = '';
  String _barCode = '';
  DateTime? _deliveryDate;

  List<Category> _categories = [];
  List<Producent> _producents = [];
  List<Supplier> _suppliers = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    _categories = await ApiService().getCategories();
    _producents = await ApiService().getProducents();
    _suppliers = await ApiService().getSuppliers();
    setState(() {});
  }

  Future<void> _selectDate(BuildContext context, String type) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (type == "expiration") {
          _expirationDate = picked;
        } else {
          _deliveryDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: Validators.validateNotEmpty,
                onChanged: (value) {
                  _name = value;
                },
              ),
              DropdownButtonFormField(
                value: _selectedCategory,
                items: _categories.map((Category category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.categoryName),
                  );
                }).toList(),
                onChanged: (Category? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              DropdownButtonFormField(
                value: _selectedProducent,
                items: _producents.map((Producent producent) {
                  return DropdownMenuItem(
                    value: producent,
                    child: Text(producent.name),
                  );
                }).toList(),
                onChanged: (Producent? newValue) {
                  setState(() {
                    _selectedProducent = newValue;
                  });
                },
                decoration: const InputDecoration(labelText: 'Producent'),
              ),
              DropdownButtonFormField(
                value: _selectedSupplier,
                items: _suppliers.map((Supplier supplier) {
                  return DropdownMenuItem(
                    value: supplier,
                    child: Text(supplier.name),
                  );
                }).toList(),
                onChanged: (Supplier? newValue) {
                  setState(() {
                    _selectedSupplier = newValue;
                  });
                },
                decoration: const InputDecoration(labelText: 'Supplier'),
              ),
              ListTile(
                title: Text(
                    "Expiration Date: ${_expirationDate?.toLocal().toString().split(' ')[0] ?? ''}"),
                trailing: const Icon(Icons.calendar_today),
                onTap: () {
                  _selectDate(context, "expiration");
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Quantity'),
                validator: Validators.validateQuantity,
                onChanged: (value) {
                  _quantity = value;
                },
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Bar Code'),
                validator: Validators.validateBarcode,
                onChanged: (value) {
                  _barCode = value;
                },
                keyboardType: TextInputType.number,
              ),
              ListTile(
                title: Text(
                    "Delivery Date: ${_deliveryDate?.toLocal().toString().split(' ')[0] ?? ''}"),
                trailing: const Icon(Icons.calendar_today),
                onTap: () {
                  _selectDate(context, "delivery");
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Product product = Product(
                      id: '',
                      name: _name,
                      categoryId: _selectedCategory!.id,
                      producentId: _selectedProducent!.id,
                      expirationDate: _expirationDate!.toIso8601String(),
                      quantity: int.parse(_quantity),
                      barCode: _barCode,
                      deliveryDate: _deliveryDate!.toIso8601String(),
                      supplierId: _selectedSupplier!.id,
                      userId: '800ff2de-c9a2-4c5d-a90b-c585728a13ff',
                    );

                    NavigatorState navigator = Navigator.of(context);

                    await ApiService().addProduct(product);

                    navigator.pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const ProductsScreen(),
                      ),
                    );
                  }
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
