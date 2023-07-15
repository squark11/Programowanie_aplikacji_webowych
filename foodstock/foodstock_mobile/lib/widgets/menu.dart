import 'package:flutter/material.dart';
import 'package:foodstock_mobile/config/constanst.dart';
import 'package:foodstock_mobile/screens/login_screen.dart';

class Menu extends StatelessWidget {
  final Function(int) onItemSelected;

  const Menu({required this.onItemSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: secondaryColor,
              ),
              child: Center(
                child: Text(
                  'Food Stack\n Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            menuItem(0, Icons.person, 'Profile', context: context),
            menuItem(1, Icons.food_bank, 'Products', context: context),
            menuItem(2, Icons.category, 'Category', context: context),
            menuItem(3, Icons.local_shipping, 'Supplier', context: context),
            menuItem(4, Icons.business, 'Producent', context: context),
            menuItem(5, Icons.logout, 'Logout', context: context),
          ],
        ),
      ),
    );
  }

  Widget menuItem(int index, IconData icon, String title,
      {required BuildContext context}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        if (index == 5) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        } else {
          Navigator.pop(context);
          onItemSelected(index);
        }
      },
    );
  }
}
