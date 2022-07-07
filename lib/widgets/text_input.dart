import 'package:flutter/material.dart';
import 'package:what_the_food/colours.dart';

class TextInput extends StatelessWidget
{
	final TextEditingController controller;
	final String hint;

	TextInput({ Key? key, required this.controller, required this.hint, String? value })
		: super(key: key)
	{
		if (value != null)
		{
			controller.text = value;
		}
	}

	@override
	Widget
	build(BuildContext context)
	{
		return TextField(
			controller: controller,
			decoration: InputDecoration(
				hintText: hint,
				enabledBorder: OutlineInputBorder(
					borderSide: const BorderSide(
						color: Colours.fadedBlue,
						width: 2,
					),
					borderRadius: BorderRadius.circular(10),
				),
				focusedBorder: OutlineInputBorder(
					borderSide: const BorderSide(
						color: Colours.green,
						width: 2,
					),
					borderRadius: BorderRadius.circular(10),
				)
			),
		);
	}
}