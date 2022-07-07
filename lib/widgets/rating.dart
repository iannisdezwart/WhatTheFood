import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:what_the_food/colours.dart';

class Rating extends StatelessWidget
{
	final num rating;

	String
	formattedRating()
	{
		return rating.toStringAsFixed(1);
	}

	const Rating({ Key? key, required this.rating }) : super(key: key);

	@override
	Widget
	build(BuildContext context)
	{
		return Row(
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
							formattedRating(),
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
		);
	}
}