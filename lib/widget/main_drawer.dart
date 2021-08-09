import 'package:flutter/material.dart';
import 'package:meal_app2/screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icon, void Function() tabControler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Roboto', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tabControler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
