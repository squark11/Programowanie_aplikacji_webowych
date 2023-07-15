import 'package:flutter/material.dart';
import 'package:foodstock_mobile/screens/category_screen.dart';
import 'package:foodstock_mobile/screens/profile_screen.dart';
import 'package:foodstock_mobile/screens/producent_screen.dart';
import 'package:foodstock_mobile/screens/products_screen.dart';
import 'package:foodstock_mobile/screens/supplier_screen.dart';
import 'package:foodstock_mobile/screens/login_screen.dart';
import 'package:foodstock_mobile/widgets/menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const ProfileScreen(),
      const ProductsScreen(),
      const CategoryScreen(),
      const SupplierScreen(),
      const ProducentScreen(),
      const LoginScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Stock Mobile App'),
      ),
      drawer: Menu(onItemSelected: _onMenuItemSelected),
      body: _screens[_selectedScreenIndex],
    );
  }

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }
}
