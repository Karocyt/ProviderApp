import 'package:flutter/material.dart';

import '../widgets/meal_card.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String route = '/category-meals';
  final List<Meal> _meals;
  final Function _deleteMeal;

  CategoryMealsScreen(this._meals, this._deleteMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> meals;
  String categorytitle;
  bool _inited = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_inited) {
      final Map<String, String> args =
          ModalRoute.of(context).settings.arguments;
      categorytitle = args['title'];
      meals = widget._meals
          .where((item) => item.categories.contains(args['id']))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealCard(meals[index], widget._deleteMeal);
          },
          itemCount: meals.length,
        ),
      ),
    );
  }
}
