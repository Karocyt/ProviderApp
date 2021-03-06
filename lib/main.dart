import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

import './dummy-data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> startingMeals = DUMMY_MEALS.toList(); // .toList() to get rid of const
  List<Meal> meals;
  Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };
  bool _inited = false;
  List<Meal> _favorites = [];

  @override
  initState() {
    super.initState();
    if (!_inited) {
      meals = startingMeals;
      _inited = true;
    }
  }

  void _deleteMeal(toDelete) {
    setState(() {
      startingMeals.remove(toDelete);
      _setFilters(_filters);
    });
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      meals = startingMeals.where((meal) {
        if ((_filters['glutenFree'] && !meal.isGlutenFree) ||
            (_filters['lactoseFree'] && !meal.isLactoseFree) ||
            (_filters['vegan'] && !meal.isVegan) ||
            (_filters['vegetarian'] && !meal.isVegetarian)) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isFavorite(Meal meal) {
    return _favorites.contains(meal);
  }

  void _toggleFavorite(Meal meal) {
    final existingIndex = _favorites.indexWhere((item) => item == meal);
    if (existingIndex >= 0)
      setState(() => _favorites.removeAt(existingIndex));
    else
      setState(() => _favorites.add(meal));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: TabsScreen(_favorites, _deleteMeal), // equivalent to having a '/' named route
      //initialRoute: CategoryMealsScreen.route, // if no home specified and no '/' route
      routes: {
        //'/': (_) => CategoriesScreen(),
        CategoryMealsScreen.route: (_) => CategoryMealsScreen(
            meals, _deleteMeal), //the url-like path is just a convention
        MealDetailsScreen.route: (_) => MealDetailsScreen(_toggleFavorite, _isFavorite),
        FiltersScreen.route: (_) => FiltersScreen(_filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        // trigger on undefined named route, builds a dynamic page with args
        if (settings.name == '/test')
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              appBar: AppBar(title: Text(settings.name)),
              body: Text('This is a dynamic page generated by onGenerateRoute'),
            ),
          );
        // else
        //   throw Exception('Unknown route');
        //  // exception stop rendering, hence pushing this page does nothing
        return null; // falls back to unknowRoute or initialRoute, in this order
      },
      onUnknownRoute: (settings) {
        // last resort route (if onGenerateRoute returns null or is not defined)
        // builds a dynamic page with args
        print(settings.arguments);
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(title: Text(settings.name)),
                  body: Text('This page doesn\'t exist yet'),
                ));
      },
    );
  }
}
