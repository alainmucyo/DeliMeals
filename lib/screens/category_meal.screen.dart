import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = "/category-meals";
  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = routesArgs['title'];
    final String categoryId = routesArgs['id'];

    final meals =
        availableMeals.where((el) => el.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int i) {
          return MealItem(
              id: meals[i].id,
              title: meals[i].title,
              imageUrl: meals[i].imageUrl,
              duration: meals[i].duration,
              complexity: meals[i].complexity,
              affordability: meals[i].affordability);
        },
        itemCount: meals.length,
      ),
    );
  }
}
