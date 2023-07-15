import 'package:flutter/material.dart';
import 'package:foodstock_mobile/services/api_service.dart';
import 'package:foodstock_mobile/models/product.dart';
import 'package:foodstock_mobile/screens/product_view_screen.dart';
import 'package:foodstock_mobile/screens/add_product_screen.dart';
import 'package:intl/intl.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  _loadProducts() async {
    _products = await ApiService().getProducts();
    setState(() {});
  }

  _deleteProduct(String productId) async {
    bool success = await ApiService().deleteProduct(productId);
    if (success) {
      await _loadProducts();
      setState(() {});
    } else {
      throw Exception('Failed delete product');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddProductScreen(),
                ),
              ).then((value) {
                _loadProducts();
              });
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DataTable(
          columns: [
            DataColumn(
              label: SizedBox(
                width: screenWidth * 0.3,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Product'),
                ),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: screenWidth * 0.1,
                child: const Text('Qty.'),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: screenWidth * 0.2,
                child: const Text('Exp. Date'),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: screenWidth * 0.2,
                child: const Center(
                  child: Text(''),
                ),
              ),
            ),
          ],
          columnSpacing: 5,
          rows: _products.map((product) {
            DateTime parsedExpirationDate =
                DateTime.parse(product.expirationDate);
            return DataRow(
              cells: [
                DataCell(Container(
                  constraints:
                      const BoxConstraints(maxWidth: 125, minWidth: 125),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )),
                DataCell(
                  Text(
                    product.quantity.toString(),
                  ),
                ),
                DataCell(
                  Text(
                    DateFormat('yyyy-MM-dd').format(parsedExpirationDate),
                  ),
                ),
                DataCell(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductViewScreen(productId: product.id),
                            ),
                          ).then((result) {
                            if (result == 'refresh') {
                              _loadProducts();
                            }
                          });
                        },
                        child: const Text('Details'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: const Color.fromARGB(255, 187, 52, 43),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Confirm"),
                                content: const Text(
                                    "Are you sure you want to delete the product?"),
                                actions: [
                                  TextButton(
                                    child: const Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text("Delete"),
                                    onPressed: () async {
                                      var navigator = Navigator.of(context);
                                      await _deleteProduct(product.id);
                                      navigator.pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProductScreen(),
            ),
          ).then((value) {
            _loadProducts();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
