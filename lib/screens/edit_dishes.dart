import 'package:flutter/material.dart';
import 'package:what_the_food/api/get_dishes.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/screens/add_dish.dart';
import 'package:what_the_food/screens/show_dish.dart';
import 'package:what_the_food/widgets/draggable_dish_card.dart';
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
			appBar: AppBar(
				title: const Header(
					title: 'Gerechten bewerken',
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
				children: [
					Center(
						child: ReorderableListView(
							onReorder: (a, b) {},
							scrollDirection: Axis.vertical,
							shrinkWrap: true,
							padding: const EdgeInsets.symmetric(vertical: 40.0),
							children: [
								for (int i = 0; i < dishes.length; i++)
									ListTile(
										key: Key('$i'),
										title: DraggableDishCard(
											dish: dishes[i],
											onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ShowDish(dish: dishes[i])))
												.then((_) => loadDishes()),
										)
									)
							],
						)
					),
				],
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