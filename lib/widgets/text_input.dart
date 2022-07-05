import 'package:flutter/material.dart';
import 'package:what_the_food/colours.dart';

class TextInput extends StatelessWidget
{
	final String hint;

	const TextInput({ Key? key, required this.hint }) : super(key: key);

	@override
	Widget
	build(BuildContext context)
	{
		return TextField(
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