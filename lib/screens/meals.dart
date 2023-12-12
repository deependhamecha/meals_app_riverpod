import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {

  const MealsScreen({
    super.key,
    required this.title,
    required this.meals
  });

  final String title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealDetailScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {

    Widget content;

    if(meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: meals[index], selectMeal: (Meal meal) {_selectMeal(context, meal);}),
      );
    } else {
      content = Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('Uh oh... nothing here!', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
        const SizedBox(height: 16),
        Text('Try selecting a different category!', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),)
      ],),);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }

  // children: [
  //         for(final m in meals)
  //           MealItem(meal: m)
  //       ]

}