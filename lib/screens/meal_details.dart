import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../data/custom_color.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class MealDetails extends StatelessWidget {
  static const routeName = "/meal-details";
  final Function toggleFavorite;
  final Function isFavorite;

  const MealDetails(this.toggleFavorite, this.isFavorite);

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Center(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget _buildSectionContainer(BuildContext context, Widget child) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]),
          color: Colors.white,
          borderRadius: BorderRadius.circular(3)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final Meal meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            _buildSectionTitle(context, "Ingredients"),
            _buildSectionContainer(
                context,
                ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        meal.ingredients[index],
                        style: TextStyle(color: CustomColor.DARK_GREY),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: meal.ingredients.length,
                )),
            SizedBox(height: 10),
            _buildSectionTitle(context, "Steps"),
            _buildSectionContainer(
              context,
              ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '#${index + 1}',
                      ),
                      radius: 20,
                    ),
                    title: Text(
                      meal.steps[index],
                      style: TextStyle(color: CustomColor.DARK_GREY),
                    ),
                  );
                },
                itemCount: meal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
