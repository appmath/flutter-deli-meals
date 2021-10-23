import 'package:flutter/material.dart';
import 'package:flutter_deli_meals/dummy_data.dart';
import 'package:flutter_deli_meals/screens/category_meals_screen.dart';
import 'package:flutter_deli_meals/screens/filters_screen.dart';
import 'package:flutter_deli_meals/screens/filters_screen.dart';
import 'package:flutter_deli_meals/screens/meal_detail_screen.dart';
import 'package:flutter_deli_meals/screens/tab_screen.dart';
import 'package:flutter_deli_meals/util/constants.dart';
import 'package:flutter_deli_meals/util/material_colors.dart';

import 'models/meal.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    gluten: false,
    lactose: false,
    vegan: false,
    vegetarian: false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if ((_filters[gluten] ?? false) && !meal.isGlutenFree) {
          return false;
        }
        if ((_filters[lactose] ?? false) && !meal.isLactoseFree) {
          return false;
        }
        if ((_filters[vegan] ?? false) && !meal.isVegan) {
          return false;
        }

        if ((_filters[vegetarian] ?? false) && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    print('existingIndex: $existingIndex');

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeal',
      theme: ThemeData(
        primarySwatch: greyMaterialColor,
        accentColor: orangeMaterialColor,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),

      // Inside each class:
      // static String id = 'welcome_screen';
      // NOTE IN SOME INSTANCES forward slash is required: initialRoute: '/',
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(favoriteMeals: _favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
            toggleFavoriteHandler: _toggleFavorite,
            isMealFavoriteHandler: _isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(
            currentFilters: _filters, saveFilterHandler: _setFilters),
      },
      onGenerateRoute: (settings) {
        print('settings: ${settings.arguments}');
        // if (settings.name == '/meal-detail') {
        //   return  MealDetailScreen(); etc
        // } else if (settings.name == '/something-else') {
        //   return SomeOtherScreen();
        // }
        return MaterialPageRoute(
            builder: (ctx) => TabScreen(favoriteMeals: _favoriteMeals));
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (ctx) => TabScreen(favoriteMeals: _favoriteMeals));
      },
    );
  }
}
// BlueGrey
// Primary: #546E7A
// Dark:  #29434E
// Light: #819CA9

// Light Orange
// Primary: #FF8A65
