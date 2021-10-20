import 'package:flutter/material.dart';
import 'package:flutter_deli_meals/screens/category_meals_screen.dart';
import 'package:flutter_deli_meals/screens/filter_screen.dart';
import 'package:flutter_deli_meals/screens/filter_screen.dart';
import 'package:flutter_deli_meals/screens/meal_detail_screen.dart';
import 'package:flutter_deli_meals/screens/tab_screen.dart';

import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
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
        '/': (context) => TabScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.routeName: (context) => FilterScreen(),
      },
      onGenerateRoute: (settings) {
        print('settings: ${settings.arguments}');
        // if (settings.name == '/meal-detail') {
        //   return  MealDetailScreen(); etc
        // } else if (settings.name == '/something-else') {
        //   return SomeOtherScreen();
        // }
        return MaterialPageRoute(builder: (ctx) => TabScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabScreen());
      },
    );
  }
}
