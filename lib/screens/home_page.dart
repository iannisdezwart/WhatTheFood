import 'package:flutter/material.dart';
import 'package:what_the_food/api/dish_of_the_day.dart';
import 'package:what_the_food/api/skip_dish_of_the_day.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/screens/list_dishes.dart';
import 'package:what_the_food/screens/show_dish.dart';
import 'package:what_the_food/widgets/header.dart';
import 'package:what_the_food/widgets/dish_of_the_day.dart';

class HomePage extends StatefulWidget
{
	final Dish dishOfTheDay;

	const HomePage({ Key? key, required this.dishOfTheDay }) : super(key: key);

	@override
	State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	late Dish dishOfTheDay;

	@override
	initState()
	{
		dishOfTheDay = widget.dishOfTheDay;
		super.initState();
	}

	Future<void>
	updateDishOfTheDay()
	async
	{
		Dish dish = await getDishOfTheDay();

		setState(()
		{
			dishOfTheDay = dish;
		});
	}

	Future<void>
	skipDish()
	async
	{
		Dish dish = await skipDishOfTheDay();

		setState(()
		{
			dishOfTheDay = dish;
		});
	}

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
			body: ListView(
				padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
				children: [
					GestureDetector(
						onTap: ()
						{
							Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => ShowDish(dish: dishOfTheDay))
							).then((_) => updateDishOfTheDay());
						},
						child: DishOfTheDay(dish: dishOfTheDay),
					),
					const Padding(padding: EdgeInsets.only(top: 40.0)),
					TextButton(
						onPressed: () => skipDish(),
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
							'Sla dit gerecht over',
							style: TextStyle(
								fontSize: 20,
								color: Colors.white,
							),
						),
					),
					const Padding(padding: EdgeInsets.only(top: 10.0)),
					TextButton(
						onPressed: ()
						{
							Navigator.push(
								context,
								MaterialPageRoute(builder: (_) => const ListDishes())
							).then((_) => updateDishOfTheDay());
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