import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:foodstock_mobile/services/api_service.dart';
import 'package:foodstock_mobile/config/constanst.dart';
import 'package:foodstock_mobile/models/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Category>> _categoriesFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: primaryColor,
      ),
      body: FutureBuilder<List<Category>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blue[50],
                  child: ListTile(
                    leading:
                        getIconForCategory(snapshot.data![index].categoryName),
                    title: Text(snapshot.data![index].categoryName),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _showEditDialog(snapshot.data![index]);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete,
                              color: Color.fromARGB(255, 146, 17, 8)),
                          onPressed: () {
                            _showDeleteConfirmationDialog(
                                snapshot.data![index].id,
                                snapshot.data![index].categoryName);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('An error occurred'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          _showAddDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _reloadCategories();
  }

  _reloadCategories() {
    _categoriesFuture = ApiService().getCategories();
  }

  _addCategory(String categoryName) async {
    Category newCategory = Category(id: '', categoryName: categoryName);
    await ApiService().addCategory(newCategory);
    _reloadCategories();
    setState(() {});
  }

  _editCategory(String id, String newCategoryName) async {
    Category category = Category(id: id, categoryName: newCategoryName);

    await ApiService().editCategory(id, category);
    _reloadCategories();
    setState(() {});
  }

  _deleteCategory(String id) async {
    await ApiService().deleteCategory(id);
    _reloadCategories();
    setState(() {});
  }

  _showAddDialog() {
    TextEditingController categoryNameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Category"),
          content: TextField(
            controller: categoryNameController,
            decoration: const InputDecoration(labelText: "Category Name"),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Add"),
              onPressed: () {
                String categoryNameAdd = categoryNameController.text;
                _addCategory(categoryNameAdd);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  _showEditDialog(Category category) {
    TextEditingController categoryNameController =
        TextEditingController(text: category.categoryName);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Category"),
          content: TextField(
            controller: categoryNameController,
            decoration: const InputDecoration(labelText: "Category Name"),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Save"),
              onPressed: () {
                _editCategory(category.id, categoryNameController.text);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(String categoryId, String categoryName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: Text(
              'Are you sure you want to delete the category: $categoryName ?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                var navigator = Navigator.of(context);
                await _deleteCategory(categoryId);
                navigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  Icon getIconForCategory(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'fruits' || 'owoce':
        return Icon(MdiIcons.fruitWatermelon, color: Colors.green);
      case 'vegetables' || 'warzywa':
        return Icon(MdiIcons.carrot, color: Colors.orange);
      case 'meat' || 'mieso':
        return Icon(MdiIcons.pigVariantOutline, color: Colors.red);
      case 'dairy products' || 'nabial':
        return Icon(MdiIcons.cheese,
            color: const Color.fromARGB(255, 216, 195, 10));
      case 'bakery products' || 'pieczywo':
        return Icon(MdiIcons.breadSlice,
            color: const Color.fromARGB(255, 141, 93, 76));
      case 'canned goods' || 'przetwory':
        return const Icon(Icons.compost_rounded, color: Colors.deepOrange);
      case 'grains and cereals' || 'zboza i produkty zbozowe':
        return Icon(MdiIcons.grain,
            color: const Color.fromARGB(255, 161, 146, 12));
      case 'beverages' || 'napoje':
        return Icon(MdiIcons.bottleSoda, color: Colors.blue);
      case 'snacks and sweets' || 'przekaski i slodycze':
        return Icon(MdiIcons.candy, color: Colors.pink);
      case 'frozen foods' || 'mrożonki':
        return Icon(MdiIcons.iceCream, color: Colors.cyan);
      case 'gluten-free products' || 'produkty bezglutenowe':
        return Icon(MdiIcons.breadSliceOutline,
            color: const Color.fromARGB(255, 131, 78, 0));
      case 'organic products' || 'produkty ekologiczne':
        return Icon(MdiIcons.rice, color: Colors.lightGreen);
      case 'spices and herbs' || 'przyprawy i ziola':
        return Icon(MdiIcons.grass,
            color: const Color.fromARGB(255, 35, 88, 37));
      case 'oils and fats' || 'oleje i tluszcze':
        return Icon(MdiIcons.oil, color: Colors.amber);
      case 'seafood' || 'produkty morskie':
        return Icon(MdiIcons.fish, color: Colors.blueAccent);
      case 'alcohols' || 'alkohole':
        return Icon(MdiIcons.bottleWine,
            color: const Color.fromARGB(255, 92, 36, 3));
      default:
        return const Icon(Icons.help_outline, color: Colors.grey);
    }
  }
}
