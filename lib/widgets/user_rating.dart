import 'package:flutter/material.dart';
import 'package:what_the_food/colours.dart';

class UserRating extends StatefulWidget
{
	final num? rating;
	final Function onRated;

	const UserRating({ Key? key, required this.rating, required this.onRated }) : super(key: key);

	@override
	State<UserRating> createState() => _UserRatingState();
}

class _UserRatingState extends State<UserRating>
{
	late num rating;

	@override
	void
	initState()
	{
		rating = widget.rating ?? 0;
		super.initState();
	}

	void
	setRating(num rating)
	{
		setState(()
		{
			this.rating = rating;
		});

		widget.onRated(rating);
	}

	@override
	Widget
	build(BuildContext context)
	{
		return Column(children: [
			const Text(
				'Jouw beoordeling',
				style: TextStyle(
					fontSize: 16,
					color: Colours.darkBlue,
				),
			),
			const Padding(padding: EdgeInsets.only(top: 10.0)),
			Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					GestureDetector(
						onTap: () => setRating(1),
						child: Icon(
							Icons.star_rate,
							color: rating < 1 ? Colours.fadedBlue : Colours.yellow,
							size: 32,
						),
					),
					GestureDetector(
						onTap: () => setRating(2),
						child: Icon(
							Icons.star_rate,
							color: rating < 2 ? Colours.fadedBlue : Colours.yellow,
							size: 32,
						),
					),
					GestureDetector(
						onTap: () => setRating(3),
						child: Icon(
							Icons.star_rate,
							color: rating < 3 ? Colours.fadedBlue : Colours.yellow,
							size: 32,
						),
					),
					GestureDetector(
						onTap: () => setRating(4),
						child: Icon(
							Icons.star_rate,
							color: rating < 4 ? Colours.fadedBlue : Colours.yellow,
							size: 32,
						),
					),
					GestureDetector(
						onTap: () => setRating(5),
						child: Icon(
							Icons.star_rate,
							color: rating < 5 ? Colours.fadedBlue : Colours.yellow,
							size: 32,
						),
					),
				],
			),
		]);
	}
}