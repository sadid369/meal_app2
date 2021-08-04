import 'package:flutter/material.dart';
import 'package:meal_app2/screen/categoryMealScreen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  CategoryItem({required this.title, required this.color, required this.id});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              end: Alignment.bottomRight,
              begin: Alignment.topLeft,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
