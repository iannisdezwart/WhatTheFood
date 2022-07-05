import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/widgets/dish_image.dart';

class DraggableDishCard extends StatelessWidget
{
	final Dish dish;

	const DraggableDishCard({ Key? key, required this.dish }) : super(key: key);

	@override
	Widget
	build(BuildContext context)
	{
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: [
				const Padding(padding: EdgeInsets.only(left: 10)),
				ClipRRect(
					borderRadius: BorderRadius.circular(10),
					child: Image.asset(
						dish.image,
						width: 90,
						height: 60,
						fit: BoxFit.cover,
					),
				),
				const Padding(padding: EdgeInsets.only(left: 20)),
				Text(
					dish.name,
					textAlign: TextAlign.center,
					style: const TextStyle(
						fontSize: 20,
						color: Colours.darkBlue,
					),
				),
				const Padding(padding: EdgeInsets.only(left: 20)),
				SvgPicture.asset(
					'assets/drag_handle.svg',
					width: 10,
					height: 10,
					fit: BoxFit.contain,
				),
				const Padding(padding: EdgeInsets.only(right: 10)),
			],
		);
	}
}