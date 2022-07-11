import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' show QuillController;
import 'package:what_the_food/api/add_dish.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/widgets/header.dart';
import 'package:what_the_food/widgets/photo_picker.dart';
import 'package:what_the_food/widgets/rich_text_editor.dart';
import 'package:what_the_food/widgets/text_input.dart';

class AddDish extends StatefulWidget
{
	const AddDish({ Key? key }) : super(key: key);

	@override
	State<AddDish> createState() => _AddDishState();
}

class _AddDishState extends State<AddDish>
{
	final dishNameInputController = TextEditingController();
	final photoPickerController = PhotoPickerController();
	final descriptionInputController = QuillController.basic();

	Future<void>
	addDishHandler()
	async
	{
		String base64EncodedFile = photoPickerController.file == null
			? '' : base64Encode(photoPickerController.file!.readAsBytesSync());

		NewDish dish = NewDish(
			name: dishNameInputController.text,
			image: base64EncodedFile,
			description: descriptionInputController.document.toDelta().toJson(),
		);

		await addDish(dish);

		if (!mounted)
		{
			return;
		}

		Navigator.pop(context);
	}

	@override
	void
	dispose()
	{
		dishNameInputController.dispose();
		descriptionInputController.dispose();
		super.dispose();
	}

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
				padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40.0),
				children: [
					PhotoPicker(controller: photoPickerController),
					const Padding(padding: EdgeInsets.only(top: 20.0)),
					TextInput(
						hint: 'Naam',
						controller: dishNameInputController,
					),
					const Padding(padding: EdgeInsets.only(top: 20.0)),
					RichTextEditor(
						controller: descriptionInputController,
					),
					const Padding(padding: EdgeInsets.only(top: 20.0)),
					TextButton(
						onPressed: addDishHandler,
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