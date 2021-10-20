import 'package:flutter/material.dart';
import 'package:flutter_deli_meals/dummy_data.dart';
import 'package:flutter_deli_meals/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    final List<Meal> categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: // DON'T FORGET TO SPECIFY THE itemCount!!!!
            ListView.builder(
          itemBuilder: (context, index) {
            final Meal categoryMeal = categoryMeals[index];
            return MealItem(
                id: categoryMeal.id,
                title: categoryMeal.title,
                imageUrl: categoryMeal.imageUrl,
                duration: categoryMeal.duration,
                complexity: categoryMeal.complexity,
                affordability: categoryMeal.affordability);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
