import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget
{
	final String title;
	final bool showBackButton;

	const Header({ Key? key, required this.title, this.showBackButton = false }) : super(key: key);

	@override
	Widget
	build(BuildContext context)
	{
		Column content = Column(
			mainAxisAlignment: MainAxisAlignment.center,
			crossAxisAlignment: CrossAxisAlignment.start,
			children: [
				SvgPicture.asset(
					'assets/header_art.svg',
					width: MediaQuery.of(context).size.width,
					fit: BoxFit.contain,
				),
				const Padding(padding: EdgeInsets.only(top: 40.0)),
				Row(children: [
					const Padding(padding: EdgeInsets.only(left: 20.0)),
					Text(
						title,
						textAlign: TextAlign.left,
						style: const TextStyle(
							fontSize: 32,
							color: Colors.white,
						),
					),
				],),
				const Padding(padding: EdgeInsets.only(bottom: 20.0)),
			],
		);

		if (showBackButton)
		{
			return Stack(
				children: [
					content,
					IconButton(
						icon: const Icon(Icons.arrow_back_ios, size: 32.0),
						onPressed: () => Navigator.pop(context),
						padding: const EdgeInsets.only(left: 20.0),
					),
				],
			);
		}

		return content;
	}
}