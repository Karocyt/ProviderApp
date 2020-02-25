import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../widgets/meal_card.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String route = '/category-meals';

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
      meals = DUMMY_MEALS
          .where((item) => item.categories.contains(args['id']))
          .toList();
      _inited = true;
    }
  }

  @override
  Widget build(BuildContext context) {

    // doesn't survive a fullr eload of the category
    // (would need to lift the state up to the categories screen)
    // but you get the idea
    void _deleteMeal(toDelete) {
      setState(() => meals.remove(toDelete));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
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
