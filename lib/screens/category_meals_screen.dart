import 'package:flutter/material.dart';
import 'package:flutter_deli_meals/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen({required this.availableMeals});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late final List<Meal> displayedMeals;
  late final String? categoryTitle;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];

      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
    }
    _loadedInitData = true;
    print('CategoryMealsScreen availableMeals: ${widget.availableMeals}');

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: // DON'T FORGET TO SPECIFY THE itemCount!!!!
            ListView.builder(
          itemBuilder: (context, index) {
            final Meal categoryMeal = displayedMeals[index];
            return MealItem(
              id: categoryMeal.id,
              title: categoryMeal.title,
              imageUrl: categoryMeal.imageUrl,
              duration: categoryMeal.duration,
              complexity: categoryMeal.complexity,
              affordability: categoryMeal.affordability,
            );
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
