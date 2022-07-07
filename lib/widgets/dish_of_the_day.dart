import 'package:flutter/material.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/widgets/dish_image.dart';
import 'package:what_the_food/widgets/rating.dart';

class DishOfTheDay extends StatelessWidget
{
	final Dish dish;

	const DishOfTheDay({ Key? key, required this.dish }) : super(key: key);

	@override
	Widget
	build(BuildContext context)
	{
		return Center(child: Column(
			children: [
				const Text(
					'Wat eten we vandaag?',
					textAlign: TextAlign.center,
					style: TextStyle(
						fontSize: 28,
						color: Colours.darkBlue,
					),
				),
				const Padding(padding: EdgeInsets.only(top: 20.0)),
				DishImage(dish: dish),
				const Padding(padding: EdgeInsets.only(top: 20.0)),
				Rating(rating: dish.rating),
			],
		));
	}
}