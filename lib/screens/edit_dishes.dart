import 'package:flutter/material.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/screens/add_dish.dart';
import 'package:what_the_food/widgets/draggable_dish_card.dart';
import 'package:what_the_food/widgets/header.dart';

class EditDishes extends StatefulWidget
{
	final List<Dish> dishes;

	const EditDishes({ Key? key, required this.dishes }) : super(key: key);

	@override
	State<EditDishes> createState() => _EditDishesState();
}

class _EditDishesState extends State<EditDishes> {
	late List<Dish> dishes;

	@override
	void initState() {
		super.initState();
		dishes = widget.dishes;
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
			body: Column(
				children: [
					Center(
						child: ReorderableListView(
							onReorder: (a, b) {},
							scrollDirection: Axis.vertical,
							shrinkWrap: true,
							padding: const EdgeInsets.symmetric(vertical: 60.0),
							children: [
								for (int i = 0; i < dishes.length; i++)
									ListTile(
										key: Key('$i'),
										title: DraggableDishCard(dish: dishes[i])
									)
							],
						)
					),
				],
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					Navigator.push(context, MaterialPageRoute(builder: (context) => AddDish()));
				},
				backgroundColor: Colours.green,
				child: const Icon(Icons.add),
			),
		);
	}
}