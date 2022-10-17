import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' show QuillController, Document;
import 'package:what_the_food/api/edit_dish.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/widgets/header.dart';
import 'package:what_the_food/widgets/photo_picker.dart';
import 'package:what_the_food/widgets/rich_text_editor.dart';
import 'package:what_the_food/widgets/text_input.dart';

class EditDish extends StatefulWidget
{
	final Dish dish;

	const EditDish({ Key? key, required this.dish }) : super(key: key);

	@override
	State<EditDish> createState() => _EditDishState();
}

class _EditDishState extends State<EditDish>
{
	final dishNameInputController = TextEditingController();
	final photoPickerController = PhotoPickerController();
	late QuillController descriptionInputController;

	Future<void>
	saveHandler()
	async
	{
		String base64EncodedFile = photoPickerController.file == null
			? '' : base64Encode(photoPickerController.file!.readAsBytesSync());

		NewDish dish = NewDish(
			name: dishNameInputController.text,
			image: base64EncodedFile,
			description: descriptionInputController.document.toDelta().toJson(),
		);

		await editDish(widget.dish.name, dish);

		if (!mounted)
		{
			return;
		}

		Navigator.pop(context, dish);
	}

	@override
	void
	initState()
	{
		if (widget.dish.description.isNotEmpty)
		{
			descriptionInputController = QuillController(
				document: Document.fromJson(widget.dish.description),
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
		dishNameInputController.dispose();
		descriptionInputController.dispose();
		super.dispose();
	}

	@override
	Widget
	build(BuildContext context)
	{
		return Scaffold(
			appBar:  Header(
				title: 'Gerecht toevoegen',
				showBackButton: true,
				context: context,
			),
			body: ListView(
				padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40.0),
				children: [
					PhotoPicker(controller: photoPickerController, defaultPhotoFilePath: widget.dish.imageFilePath ),
					const Padding(padding: EdgeInsets.only(top: 20.0)),
					TextInput(
						hint: 'Naam',
						controller: dishNameInputController,
						value: widget.dish.name,
					),
					const Padding(padding: EdgeInsets.only(top: 20.0)),
					RichTextEditor(
						controller: descriptionInputController,
					),
					const Padding(padding: EdgeInsets.only(top: 20.0)),
					TextButton(
						onPressed: saveHandler,
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
							'Opslaan',
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