import 'package:flutter/material.dart';
import 'package:what_the_food/api/get_dishes.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/screens/add_dish.dart';
import 'package:what_the_food/screens/show_dish.dart';
import 'package:what_the_food/widgets/dish_card.dart';
import 'package:what_the_food/widgets/header.dart';

class ListDishes extends StatefulWidget
{
	const ListDishes({ Key? key }) : super(key: key);

	@override
	State<ListDishes> createState() => _ListDishesState();
}

class _ListDishesState extends State<ListDishes> {
	List<Dish> dishes = [];

	void
	loadDishes()
	{
		getDishes().then((loadedDishes) => setState(()
		{
			dishes = loadedDishes;
		}));
	}

	@override
	void
	initState()
	{
		super.initState();
		loadDishes();

	}

	@override
	Widget
	build(BuildContext context)
	{
		return Scaffold(
			appBar: Header(
				title: 'Alle gerechten',
				showBackButton: true,
				context: context,
			),
			body: SingleChildScrollView(
				scrollDirection: Axis.vertical,
				padding: const EdgeInsets.symmetric(vertical: 40.0),
				child: Column(
					children: [
						for (int i = 0; i < dishes.length; i++)
							ListTile(
								key: Key('$i'),
								title: DishCard(
									dish: dishes[i],
									onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ShowDish(dish: dishes[i])))
										.then((_) => loadDishes()),
								),
							),
					],
				),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: ()
				{
					Navigator.push(context, MaterialPageRoute(builder: (context) => const AddDish()))
						.then((_) => loadDishes());
				},
				backgroundColor: Colours.green,
				child: const Icon(Icons.add),
			),
		);
	}
}