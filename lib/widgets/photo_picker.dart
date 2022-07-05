import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPicker extends StatefulWidget
{
	const PhotoPicker({ Key? key }) : super(key: key);

	@override
	State<PhotoPicker>
	createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker>
{
	ImagePicker imagePicker = ImagePicker();

	@override
	Widget
	build(BuildContext context)
	{
		return const Text('PhotoPicker');
	}
}