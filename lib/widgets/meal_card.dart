import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  static const double _borderRadius = 15;

  const MealCard(this.meal);

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(_borderRadius),
      onTap: selectMeal,
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
                      SizedBox(width: 10,),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.euro_symbol),
                      SizedBox(width: 10,),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.pan_tool),
                      SizedBox(width: 10,),
                      Text('${meal.duration} min'),
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
