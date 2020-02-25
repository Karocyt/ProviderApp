import 'package:flutter/material.dart';

import '../widgets/meal_card.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String route = '/category-meals';
  final Function _deleteMeal;
  final List<Meal> allMeals;

  CategoryMealsScreen(this.allMeals, this._deleteMeal);

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments;
    final String categoryTitle = args['title'];
    final List<Meal> meals =
        allMeals.where((item) => item.categories.contains(args['id'])).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealCard(meals[index], _deleteMeal);
          },
          itemCount: meals.length,
        ),
      ),
    );
  }
}
