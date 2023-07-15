import 'package:flutter/material.dart';
import 'package:foodstock_mobile/models/supplier.dart';
import 'package:foodstock_mobile/services/api_service.dart';

class SupplierScreen extends StatefulWidget {
  const SupplierScreen({super.key});
  @override
  _SupplierScreenState createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  late Future<List<Supplier>> _supplierListFuture;

  @override
  void initState() {
    super.initState();
    _supplierListFuture = ApiService().getSuppliers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suppliers'),
      ),
      body: FutureBuilder<List<Supplier>>(
        future: _supplierListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Supplier> suppliers = snapshot.data!;
            return ListView.builder(
              itemCount: suppliers.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blueGrey[50],
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          suppliers[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed loading suppliers'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
