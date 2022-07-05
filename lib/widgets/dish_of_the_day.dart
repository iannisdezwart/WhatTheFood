import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/widgets/dish_image.dart';

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
				DishImage(name: dish.name, image: dish.image),
				const Padding(padding: EdgeInsets.only(top: 20.0)),
				Row(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						SvgPicture.asset(
							'assets/star.svg',
							width: 32,
							height: 32,
						),
						const Padding(padding: EdgeInsets.only(left: 10.0)),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.end,
							children: [
								Text(
									'${dish.rating}',
									style: const TextStyle(
										fontSize: 24,
										color: Colours.darkBlue,
									),
								),
								const Text(
									'/5.0',
									style: TextStyle(
										fontSize: 16,
										color: Colours.fadedBlue,
									),
								),
							],
						),
					],
				)
			],
		));
	}
}