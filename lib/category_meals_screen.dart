import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String id;
  final String title;

  CategoryMealsScreen({
    @required this.id,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Recipes'), // placeholder
      ),
    );
  }
}
