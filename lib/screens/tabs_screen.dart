import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';
import '../widgets/menu_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // reminder for Maps and lists: type 'dynamic' == type 'Object'
  List<Map<String, Widget>> _pages = [
    {
      'page': const CategoriesScreen(),
      'title': const Text('Categories'),
      'icon': const Icon(Icons.category),
    },
    {
      'page': FavoritesScreen(),
      'title': const Text('Favorites'),
      'icon': const Icon(Icons.star),
    },
    // can hold actionsButtons too !
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() => _selectedPageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]['title'],
      ),
      drawer: MenuDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor:
            Theme.of(context).primaryColor, // only needed when fixed
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        items: _pages
            .map((page) => BottomNavigationBarItem(
                  //backgroundColor: Theme.of(context).primaryColor, // only needing when shifting
                  icon: page['icon'],
                  title: page['title'],
                ))
            .toList(),
      ),
    );
  }
}
