import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MenuDrawer extends StatelessWidget {
  _buildMenuItem(context,
      {@required IconData icon, @required String title, Function onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Let\'s cook a menu.',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildMenuItem(
            context,
            icon: Icons.restaurant,
            title: 'Home',
            onTap: () {
              if (ModalRoute.of(context).settings.name == '/')
                Navigator.of(context).pop();
              else
                Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          _buildMenuItem(
            context,
            icon: Icons.settings,
            title: 'Settings',
            onTap: () => Navigator.of(context).pushNamed(FiltersScreen.route),
          ),
        ],
      ),
    );
  }
}
