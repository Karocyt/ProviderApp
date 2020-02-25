import 'package:flutter/material.dart';

import '../screens/meal_details_screen.dart';

import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  final Function removeMeal;
  static const double _borderRadius = 15;

  const MealCard(this.meal, this.removeMeal);

  Widget get affordabilityWidget {
    List<Widget> l = [];
    const icon = Icon(Icons.euro_symbol);
    for (int i = 0; i <= meal.affordability.index; i++) {
      l.add(icon);
    }
    return Row(children: l);
  }

  Widget get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return const Text('Simple');
      case Complexity.Challenging:
        return const Text('Challenging');
      case Complexity.Hard:
        return const Text('Hard');
    }
    return Container(); // to shutdown warning
  }

  void selectMeal(context) {
    Navigator.of(context).pushNamed(
      MealDetailsScreen.route,
      arguments: meal,
    ).then((mealToDelete) {
      if (mealToDelete != null)
        removeMeal(mealToDelete);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(_borderRadius),
      onTap: () => selectMeal(context),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MealCard._borderRadius),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(MealCard._borderRadius),
                    topRight: Radius.circular(MealCard._borderRadius),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  // only in stack
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true, // multiline
                      overflow: TextOverflow.fade, // safety
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            // ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 10,
                      ),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  affordabilityWidget,
                  Row(
                    children: <Widget>[
                      Icon(Icons.pan_tool),
                      SizedBox(
                        width: 10,
                      ),
                      complexityText,
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
