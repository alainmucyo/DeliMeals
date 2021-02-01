import 'package:flutter/material.dart';
import '../data/custom_color.dart';
import '../models/meal.dart';
import '../screens/meal_details.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key key,
      @required this.title,
      @required this.id,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability})
      : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";
      case Affordability.Pricey:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    const double BORDER_RADIUS = 4;

    return InkWell(
      onTap: () =>
          Navigator.of(context).pushNamed(MealDetails.routeName, arguments: id),
      child: Card(
        margin: const EdgeInsets.all(15),
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BORDER_RADIUS)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(BORDER_RADIUS),
                      topRight: Radius.circular(BORDER_RADIUS)),
                  child: Image.network(
                    imageUrl,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: 300,
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.black54,
                    ),
                    child: Text(
                      title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).canvasColor),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: CustomColor.DARK_GREY,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '$duration min',
                        style: TextStyle(
                            color: CustomColor.DARK_GREY, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        color: CustomColor.DARK_GREY,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$complexityText',
                          style: TextStyle(
                              color: CustomColor.DARK_GREY, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: CustomColor.DARK_GREY,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$affordabilityText',
                          style: TextStyle(
                              color: CustomColor.DARK_GREY, fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
