import 'package:flutter/material.dart';
import '../data/custom_color.dart';
import '../screens/filter.screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildMenuTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, color: CustomColor.DARK_GREY),
      title: Text(
        title,
        style: TextStyle(
            color: CustomColor.DARK_GREY,
            fontSize: 22,
            fontFamily: "RobotoCondensed",
            letterSpacing: 0.5),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10, top: 20),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[200], width: 1.5))),
            child: Text(
              "DeliMeal",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontFamily: "RobotoCondensed",
                letterSpacing: 1,
              ),
            ),
          ),
          SizedBox(height: 20),
          _buildMenuTile("Meals", Icons.restaurant,
              () => Navigator.of(context).pushReplacementNamed("/")),
          // SizedBox(height: 20),
          _buildMenuTile(
              "Settings",
              Icons.settings,
              () => Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName)),
        ],
      ),
    );
  }
}
