import 'package:flutter/material.dart';
import 'package:flutter_deli_meals/screens/categories_screen.dart';
import 'package:flutter_deli_meals/screens/favorite_screen.dart';
import 'package:flutter_deli_meals/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tab-screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  static const String title = 'title';
  static const String page = 'page';

  final List<Map<String, dynamic>> _pages = [
    {page: CategoriesScreen(), title: 'Categories'},
    {page: FavoriteScreen(), title: 'Favorites'},
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var selectedTab = _pages[_selectedPageIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      drawer: MainDrawer(),
      body: selectedTab[page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting. Default type is fixed
        // selectedFontSize
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: selectedTab[title],
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: selectedTab[title],
          ),
        ],
      ),
    );
  }
}
