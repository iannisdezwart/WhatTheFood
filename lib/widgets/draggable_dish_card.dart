import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/screens/show_dish.dart';
import 'package:what_the_food/utilities/api_route.dart';

class DraggableDishCard extends StatelessWidget
{
	final Dish dish;
	final Function onPressed;

	const DraggableDishCard({ Key? key, required this.dish, required this.onPressed }) : super(key: key);

	@override
	Widget
	build(BuildContext context)
	{
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: [
				const Padding(padding: EdgeInsets.only(left: 10)),
				GestureDetector(
					onTap: () => onPressed(),
					child: Row(
						children: [
							ClipRRect(
								borderRadius: BorderRadius.circular(10),
								child: Image.network(
									apiRoute('/get-image', params: { 'file': dish.imageFilePath }).toString(),
									width: 90,
									height: 60,
									fit: BoxFit.cover,
								),
							),
							const Padding(padding: EdgeInsets.only(left: 20)),
							SizedBox(
								width: 120,
								child: Text(
									dish.name,
									textAlign: TextAlign.center,
									style: const TextStyle(
										fontSize: 20,
										color: Colours.darkBlue,
									),
								),
							),
						]
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