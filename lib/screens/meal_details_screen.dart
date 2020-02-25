import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String route = '/meal-details';

  MealDetailsScreen();

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),),
      body: Text('Youhou'),
    );
  }
}