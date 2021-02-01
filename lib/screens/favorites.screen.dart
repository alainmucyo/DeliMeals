import 'package:flutter/material.dart';
import '../data/custom_color.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.length == 0
        ? Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                "You don't have favorites yet - start adding your favorites!",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,color: CustomColor.DARK_GREY),
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (BuildContext context, int i) {
              return MealItem(
                id: favoriteMeals[i].id,
                title: favoriteMeals[i].title,
                imageUrl: favoriteMeals[i].imageUrl,
                duration: favoriteMeals[i].duration,
                complexity: favoriteMeals[i].complexity,
                affordability: favoriteMeals[i].affordability,
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
