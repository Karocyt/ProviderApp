import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const String route = '/filters';
  final Function _setFilters;
  final Map<String, bool> _filters;

  FiltersScreen(this._filters, this._setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree, _vegan, _vegetarian, _lactoseFree;

  @override
  initState() {
    super.initState();
    _glutenFree = widget._filters['glutenFree'];
    _vegan = widget._filters['vegan'];
    _vegetarian = widget._filters['vegetarian'];
    _lactoseFree = widget._filters['lactoseFree'];
  }

  Widget _buildSwitchTile(
      String title, bool value, Function(bool) onChanged, String subtitle) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          GestureDetector(
            child: Icon(Icons.check),
            onTap: () {
              widget._setFilters({
                'glutenFree': _glutenFree,
                'lactoseFree': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              });
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'Filters',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchTile(
                    'Gluten-Free',
                    _glutenFree,
                    (newValue) => setState(() {
                      _glutenFree = newValue;
                    }),
                    'Bla bla blop',
                  ),
                  _buildSwitchTile(
                    'Lactose-Free',
                    _lactoseFree,
                    (newValue) => setState(() {
                      _lactoseFree = newValue;
                    }),
                    'Bla bla blop',
                  ),
                  _buildSwitchTile(
                    'Vegetarian',
                    _vegetarian,
                    (newValue) => setState(() {
                      _vegetarian = newValue;
                    }),
                    'Bla bla blop',
                  ),
                  _buildSwitchTile(
                    'Vegan',
                    _vegan,
                    (newValue) => setState(() {
                      _vegan = newValue;
                    }),
                    'Bla bla blop',
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
