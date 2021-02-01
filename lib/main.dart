import 'package:flutter/material.dart';
import './data/custom_color.dart';
import './data/dummy_data.dart';
import './models/meal.dart';
import './screens/category_meal.screen.dart';
import './screens/filter.screen.dart';
import './screens/meal_details.dart';
import './screens/tabs.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _getAvailableMeals = DUMMY_MEALS;
  List<Meal> _favoritesMeal = [];
  Map<String, bool> _mealFilters = {
    "glutenFree": false,
    "vegetarian": false,
    "vegan": false,
    "lactoseFree": false,
  };

  void _setMealFilters(Map<String, bool> filters) {
    setState(() {
      _mealFilters = filters;
      _getAvailableMeals = DUMMY_MEALS.where((element) {
        if (_mealFilters['glutenFree'] && !element.isGlutenFree) return false;
        if (_mealFilters['vegetarian'] && !element.isVegetarian) return false;
        if (_mealFilters['vegan'] && !element.isVegan) return false;
        if (_mealFilters['lactoseFree'] && !element.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String id) {
    final existingIndex = _favoritesMeal.indexWhere((e) => e.id == id);
    if (existingIndex >= 0) {
      setState(() {
        _favoritesMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritesMeal.add(DUMMY_MEALS.firstWhere((e) => e.id == id));
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoritesMeal.indexWhere((e) => e.id == id) >= 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeal',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(247, 250, 252, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline1: TextStyle(
                fontSize: 22,
                letterSpacing: 1.1,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: CustomColor.SUPER_DARK_GREY),
            headline2: TextStyle(
                fontSize: 22,
                letterSpacing: 1,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: CustomColor.DARK_GREY)),
      ),
      routes: {
        "/": (_) => TabsScreen(_favoritesMeal),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_getAvailableMeals),
        MealDetails.routeName: (_) => MealDetails(_toggleFavorites,_isFavorite),
        FilterScreen.routeName: (_) =>
            FilterScreen(_mealFilters, _setMealFilters)
      },
    );
  }
}
