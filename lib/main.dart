import 'package:flutter/material.dart';
import 'package:meal_app2/dummy_data.dart';
import 'package:meal_app2/screen/categories_screen.dart';
import 'package:meal_app2/screen/categoryMealScreen.dart';
import 'package:meal_app2/screen/filters_screen.dart';
import 'package:meal_app2/screen/meal_details_screen.dart';
import 'package:meal_app2/screen/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter['gluten'] == true && meal.isGlutenFree == false) {
          return false;
        }
        if (_filter['lactose'] == true && meal.isLactoseFree == false) {
          return false;
        }
        if (_filter['vegan'] == true && meal.isVegan == false) {
          return false;
        }
        if (_filter['vegetarian'] == true && meal.isVegetarian == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) {
      return meal.id == mealId;
    });
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(
              saveFilter: _setFilters,
              currentFilters: _filter,
            ),
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
