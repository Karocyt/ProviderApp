import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String route = '/meal-details';

  MealDetailsScreen();

  Widget _buildTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.title),
    );
  }

  Widget _buildContainer({Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      height: 150, // could be MediaQueried but nique
      width: 300,
      child: child,
    );
  }

  Widget _buildBody(BuildContext context, Meal meal) {
    // _buildbody(int id) {
    // //fetch meal by id:
    //    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          _buildTitle(context, 'Ingredients'),
          _buildContainer(
            child: ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(meal.ingredients[index]),
                ),
              ),
            ),
          ),
          _buildTitle(context, 'Steps'),
          _buildContainer(
            child: ListView.separated(
              itemCount: meal.steps.length,
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('#${index + 1}'),
                    ),
                    //color: Theme.of(context).accentColor,
                    title: Text(meal.steps[index]),
                  ),
                ],
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: _buildBody(context, meal),
    );
  }
}
