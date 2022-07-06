import 'package:flutter/material.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/widgets/header.dart';
import 'package:what_the_food/widgets/photo_picker.dart';
import 'package:what_the_food/widgets/text_input.dart';

class AddDish extends StatefulWidget
{
	const AddDish({ Key? key }) : super(key: key);

	@override
	State<AddDish> createState() => _AddDishState();
}

class _AddDishState extends State<AddDish>
{
	@override
	Widget
	build(BuildContext context)
	{
		return Scaffold(
			appBar: AppBar(
				title: const Header(
					title: 'Gerecht toevoegen',
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
				padding: const EdgeInsets.symmetric(horizontal: 20),
				children: [
					const Padding(padding: EdgeInsets.only(top: 60.0)),
					const PhotoPicker(),
					const Padding(padding: EdgeInsets.only(top: 20.0)),
					const TextInput(hint: 'Naam'),
					const Padding(padding: EdgeInsets.only(top: 20.0)),
					TextButton(
						onPressed: () {},
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
							'Toevoegen',
							style: TextStyle(
								fontSize: 20,
							),
						),
					)
				],
			)
		);
	}
}