import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegetarian= widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Adjust your meal selection',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                value: _glutenFree,
                onChanged: (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
                title: Text('Gluten-free'),
                subtitle: Text('Only include gluten free meals'),
              ),
              SwitchListTile(
                value: _lactoseFree,
                onChanged: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
                title: Text('Lactose-free'),
                subtitle: Text('Only include lactose free meals'),
              ),
              SwitchListTile(
                value: _vegetarian,
                onChanged: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
                title: Text('Vegetarian'),
                subtitle: Text('Only include vegetarian meals'),
              ),
              SwitchListTile(
                value: _vegan,
                onChanged: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
                title: Text('Vegan'),
                subtitle: Text('Only include vegan meals'),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
