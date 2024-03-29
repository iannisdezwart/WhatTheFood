import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' show QuillController, Document;
import 'package:what_the_food/api/delete_dish.dart';
import 'package:what_the_food/api/rate_dish.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/screens/edit_dish.dart';
import 'package:what_the_food/widgets/dish_image.dart';
import 'package:what_the_food/widgets/header.dart';
import 'package:what_the_food/widgets/rating.dart';
import 'package:what_the_food/widgets/rich_text_view.dart';
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
	late QuillController descriptionInputController;

	@override
	initState()
	{
		dish = widget.dish;

		if (dish.description.isNotEmpty)
		{
			descriptionInputController = QuillController(
				document: Document.fromJson(dish.description),
				selection: const TextSelection.collapsed(offset: 0));
		}
		else
		{
			descriptionInputController = QuillController.basic();
		}

		super.initState();
	}

	@override
	void
	dispose()
	{
		descriptionInputController.dispose();
		super.dispose();
	}

	Future<void>
	handleUserRating(num rating)
	async
	{
		setState(()
		{
			dish.yourRating = rating;
		});

		num newRating = await rateDish(dish, rating);

		setState(()
		{
			dish.rating = newRating;
		});
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
			appBar: Header(
				title: 'Gerecht bekijken',
				showBackButton: true,
				context: context,
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
					RichTextView(controller: descriptionInputController),
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