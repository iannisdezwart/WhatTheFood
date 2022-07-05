import 'package:flutter/material.dart';
import 'package:what_the_food/colours.dart';

class DishImage extends StatelessWidget
{
	final String name;
	final String image;

	const DishImage({ Key? key, required this.name, required this.image }) : super(key: key);

	@override
	Widget
	build(BuildContext context)
	{
		return Stack(children: [
			ClipRRect(
				borderRadius: BorderRadius.circular(30),
				child: Image.asset(
					image,
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
										name,
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