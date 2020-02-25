import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_card.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favorites;
  final Function _removeMeal;

  FavoritesScreen(this._favorites, this._removeMeal);

  @override
  Widget build(BuildContext context) {
    return _favorites.isEmpty
        ? Center(child: Text('You have no Favorites yet!'))
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealCard(_favorites[index], _removeMeal);
            },
            itemCount: _favorites.length,
          );
  }
}
