import 'package:flutter/material.dart';

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
    final args = ModalRoute.of(context).settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(args['title']),
      ),
      body: Center(
        child: Text('Recipes'), // placeholder
      ),
    );
  }
}
