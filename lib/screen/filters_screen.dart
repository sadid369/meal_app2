import 'package:flutter/material.dart';
import 'package:meal_app2/widget/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filter-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filter Screen'),
      ),
      body: Center(
        child: Text('Finter Screen'),
      ),
    );
  }
}
