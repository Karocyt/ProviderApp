import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../widgets/category_widget.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
        actions: <Widget>[
          GestureDetector(
            child: Icon(Icons.memory),
            onTap: () => Navigator.of(context).pushNamed('/error-test'),
          ),
          SizedBox(width: 20,),
          GestureDetector(
            child: Icon(Icons.error),
            onTap: () => Navigator.of(context).pushNamed('/test'),
          ),
        ],
      ),
      body: GridView(
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
      ),
    );
  }
}
