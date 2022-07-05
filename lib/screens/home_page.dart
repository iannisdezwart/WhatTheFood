import 'package:flutter/material.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/screens/edit_dishes.dart';
import 'package:what_the_food/widgets/header.dart';
import 'package:what_the_food/widgets/dish_of_the_day.dart';

class HomePage extends StatelessWidget
{
	final List<Dish> dishes;

	const HomePage({ Key? key, required this.dishes }) : super(key: key);

	@override
	Widget
	build(BuildContext context)
	{
		return Scaffold(
			appBar: AppBar(
				title: const Header(title: 'What The Food?!'),
				titleSpacing: 0,
				centerTitle: false,
				backgroundColor: Colours.green,
				toolbarHeight: 300,
				shape: const ContinuousRectangleBorder(
					borderRadius: BorderRadius.only(
						bottomLeft: Radius.circular(80),
						bottomRight: Radius.circular(80),
					),
				),
				shadowColor: Colors.transparent,
			),
			body: Column(
				children: [
					const Padding(padding: EdgeInsets.only(top: 60.0)),
					const DishOfTheDay(dish: Dish(
						name: 'Pasta Carbonara',
						image: 'assets/carbonara.png',
						rating: 3.9
					)),
					const Padding(padding: EdgeInsets.only(top: 40.0)),
					TextButton(
						onPressed: () {
							Navigator.push(
								context,
								MaterialPageRoute(builder: (_) => EditDishes(dishes: dishes,))
							);
						},
						style: ButtonStyle(
							backgroundColor: MaterialStateProperty.all(Colours.green),
							foregroundColor: MaterialStateProperty.all(Colors.white),
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
							'Gerechten bewerken',
							style: TextStyle(
								fontSize: 20,
								color: Colors.white,
							),
						),
					),
				],
			),
		);
	}
}