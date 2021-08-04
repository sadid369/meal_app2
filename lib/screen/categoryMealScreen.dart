import 'package:flutter/material.dart';
import 'package:meal_app2/dummy_data.dart';
import 'package:meal_app2/widget/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meal';
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealScreen({required this.categoryId, required this.categoryTitle});
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
