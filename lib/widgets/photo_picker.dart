import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/utilities/api_route.dart';

class PhotoPickerController extends ChangeNotifier
{
	File? file;

	void
	setImage(File f)
	{
		file = f;
		notifyListeners();
	}

}

class PhotoPicker extends StatefulWidget
{
	final PhotoPickerController controller;
	final String? defaultPhotoFilePath;

	const PhotoPicker({ Key? key, required this.controller, this.defaultPhotoFilePath }) : super(key: key);

	@override
	State<PhotoPicker>
	createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker>
{
	ImagePicker imagePicker = ImagePicker();
	ClipRRect? image;

	@override
	void
	initState()
	{
		if (widget.defaultPhotoFilePath == null)
		{
			return;
		}

		Image img = Image.network(
			apiRoute('/get-image', params: { 'file': widget.defaultPhotoFilePath }).toString()
		);

		image = ClipRRect(
			borderRadius: BorderRadius.circular(10),
			child: img,
		);

		super.initState();
	}

	void
	editImage()
	async
	{
		XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

		if (file == null)
		{
			return;
		}

		setState(()
		{
			File f = File(file.path);
			widget.controller.setImage(f);

			image = ClipRRect(
				borderRadius: BorderRadius.circular(10),
				child: Image.file(
					f,
					fit: BoxFit.cover,
				),
			);
		});
	}

	@override
	Widget
	build(BuildContext context)
	{
		return SizedBox(
			height: 200,
			width: 300,
			child: GestureDetector(
				onTap: editImage,
				child: DecoratedBox(
					decoration: const BoxDecoration(
						color: Colours.fadedBlue,
						borderRadius: BorderRadius.all(Radius.circular(10)),
					),
					child: (image == null)
						? const Icon(
							Icons.photo_library,
							color: Colors.white,
						)
						: image,
				),
			),
		);
	}
}