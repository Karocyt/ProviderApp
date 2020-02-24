import 'package:flutter/material.dart';
import '../category_meals_screen.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  static const double _borderRadius = 15;

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_ /*context*/) {
          return CategoryMealsScreen(
            title: title,
            id: id,
          );
        },
      ),
    );
  }

  CategoryWidget(this.title, this.color, this.id);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // GestureDetector with visual ripple effect
      onTap: () => selectCategory(context),
      splashColor: Color.alphaBlend(color, Colors.black12),
      borderRadius: BorderRadius.circular(CategoryWidget._borderRadius),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(CategoryWidget._borderRadius),
        ),
      ),
    );
  }
}
