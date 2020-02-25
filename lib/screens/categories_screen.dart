import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {

  const CategoriesScreen();

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map((category) => CategoryWidget(
                category.title,
                category.color,
                category.id,
              ))
          .toList(),
    );
  }
}
