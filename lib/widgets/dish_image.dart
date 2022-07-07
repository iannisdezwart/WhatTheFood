import 'package:flutter/material.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/utilities/api_route.dart';

class DishImage extends StatelessWidget
{
	final Dish dish;

	const DishImage({ Key? key, required this.dish }) : super(key: key);

	@override
	Widget
	build(BuildContext context)
	{
		return Stack(children: [
			ClipRRect(
				borderRadius: BorderRadius.circular(30),
				child: Image.network(
					apiRoute('/get-image', params: { 'file': dish.imageFilePath }).toString(),
					width: 300,
					height: 200,
					fit: BoxFit.cover,
				),
			),
			SizedBox(
				width: 300,
				height: 200,
				child: Column(
					mainAxisAlignment: MainAxisAlignment.end,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: [
						Container(
							width: 300,
							height: 48,
							color: Colors.white.withOpacity(0.6),
							child: Column(
								mainAxisAlignment: MainAxisAlignment.center,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: [
									Text(
										dish.name,
										textAlign: TextAlign.center,
										style: const TextStyle(
											fontSize: 24,
											color: Colours.darkBlue,
										),
									)
								],
							)
						),
					],
				)
			)
		]);
	}
}