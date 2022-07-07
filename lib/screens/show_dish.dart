import 'package:flutter/material.dart';
import 'package:what_the_food/api/delete_dish.dart';
import 'package:what_the_food/api/rate_dish.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/screens/edit_dish.dart';
import 'package:what_the_food/widgets/dish_image.dart';
import 'package:what_the_food/widgets/header.dart';
import 'package:what_the_food/widgets/rating.dart';
import 'package:what_the_food/widgets/user_rating.dart';

class ShowDish extends StatefulWidget
{
	final Dish dish;

	const ShowDish({ Key? key, required this.dish }) : super(key: key);

	@override
	State<ShowDish> createState() => _ShowDishState();
}

class _ShowDishState extends State<ShowDish> {
	late Dish dish;

	@override
	initState()
	{
		dish = widget.dish;
		super.initState();
	}

	Future<void>
	handleUserRating(num rating)
	async
	{
		setState(()
		{
			dish.yourRating = rating;
		});

		await rateDish(dish, rating);
	}

	Future<void>
	deleteDishHandler()
	async
	{
		await deleteDish(dish);

		if (!mounted)
		{
			return;
		}

		Navigator.pop(context);
	}

	Future<void>
	editDishHandler()
	async
	{
		Navigator.push(context, MaterialPageRoute(builder: (context) => EditDish(dish: dish)))
			.then((_) => Navigator.pop(context));
	}

	@override
	Widget
	build(BuildContext context)
	{
		return Scaffold(
			appBar: AppBar(
				title: const Header(
					title: 'Gerecht bekijken',
					showBackButton: true,
				),
				titleSpacing: 0,
				centerTitle: false,
				backgroundColor: Colours.green,
				toolbarHeight: 300,
				automaticallyImplyLeading: false,
				shape: const ContinuousRectangleBorder(
					borderRadius: BorderRadius.only(
						bottomLeft: Radius.circular(80),
						bottomRight: Radius.circular(80),
					),
				),
				shadowColor: Colors.transparent,
			),
			body: ListView(
				padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40.0),
				children: [
					Center(child: Column(
						children: [
							DishImage(dish: dish),
						]
					)),
					const Padding(padding: EdgeInsets.only(top: 20.0)),
					Rating(rating: dish.rating),
					const Padding(padding: EdgeInsets.only(top: 20.0)),
					UserRating(
						rating: dish.yourRating,
						onRated: handleUserRating
					),
					const Padding(padding: EdgeInsets.only(top: 20.0)),
					TextButton(
						onPressed: editDishHandler,
						style: ButtonStyle(
							backgroundColor: MaterialStateProperty.all(Colours.green),
							shape: MaterialStateProperty.all(RoundedRectangleBorder(
								borderRadius: BorderRadius.circular(15.0),
							)),
							padding: MaterialStateProperty.all(
								const EdgeInsets.symmetric(
									horizontal: 20.0,
									vertical: 10.0
								)
							),
						),
						child: const Text(
							'Bewerken',
							style: TextStyle(
								fontSize: 20,
								color: Colors.white
							),
						),
					),
					const Padding(padding: EdgeInsets.only(top: 10.0)),
					TextButton(
						onPressed: deleteDishHandler,
						style: ButtonStyle(
							backgroundColor: MaterialStateProperty.all(Colours.red),
							shape: MaterialStateProperty.all(RoundedRectangleBorder(
								borderRadius: BorderRadius.circular(15.0),
							)),
							padding: MaterialStateProperty.all(
								const EdgeInsets.symmetric(
									horizontal: 20.0,
									vertical: 10.0
								)
							),
						),
						child: const Text(
							'Verwijderen',
							style: TextStyle(
								fontSize: 20,
								color: Colors.white
							),
						),
					),
				],
			)
		);
	}
}