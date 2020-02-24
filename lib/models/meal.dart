import 'package:flutter/foundation.dart';

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

class Meal {
  final String id, title, imageUrl;
  final List<String> categories, ingredients, steps;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  final bool isGlutenFree, isVegan, isVegetarian, isLactoseFree;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.categories,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegan = false,
    this.isVegetarian = false,
  });
}
