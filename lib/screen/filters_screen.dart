import 'package:flutter/material.dart';
import 'package:meal_app2/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function saveFilter;
  final Map<String, bool> currentFilters;
  FilterScreen({required this.currentFilters, required this.saveFilter});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactosefree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    void Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Filter Screen'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactosefree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilter(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust our meal selections',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                    'GlutenFree', 'Only include Gluten Free Meals', _glutenFree,
                    (newNalue) {
                  setState(() {
                    _glutenFree = newNalue;
                  });
                }),
                _buildSwitchListTile(
                    'vegan', 'Only include Vegan Meals', _vegan, (newNalue) {
                  setState(() {
                    _vegan = newNalue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose Free',
                    'Only include lactose free Meals',
                    _lactosefree, (newNalue) {
                  setState(() {
                    _lactosefree = newNalue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include Vegetarian  Meals', _vegetarian,
                    (newNalue) {
                  setState(() {
                    _vegetarian = newNalue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
