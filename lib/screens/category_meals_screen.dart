import 'package:flutter/material.dart';
import '../dummy-data.dart';
import '../widgets/meal_card.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String route = '/category-meals';
  // final String id;
  // final String title;

  // CategoryMealsScreen({
  //   @required this.id,
  //   @required this.title,
  // });

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final meals = DUMMY_MEALS
        .where((item) => item.categories.contains(args['id']))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(args['title']),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealCard(meals[index]);
          },
          itemCount: meals.length,
        ),
      ),
    );
  }
}
