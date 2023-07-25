import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import '../models/meal.dart';
import './favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;

  TabsScreen(this.favouriteMeal);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //final List<Meal> fMeals=widget.favouriteMeal;
  List<Widget> _pages = [CategoriesScreen()];

  final List<String> _pageName = ['Categories', 'Favourites'];

  @override
  void initState() {
    _pages = [
      CategoriesScreen(),
      FavouriteScreen(widget.favouriteMeal),
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageName[_selectedPageIndex]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favourites',
              backgroundColor: Colors.pink)
        ],
      ),
    );
  }
}
