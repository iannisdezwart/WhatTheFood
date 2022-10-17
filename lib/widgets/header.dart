import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:what_the_food/colours.dart';

class Header extends StatelessWidget implements PreferredSizeWidget
{
	final String title;
	final bool showBackButton;
	final BuildContext context;

	const Header({
		Key? key,
		required this.title,
		required this.context,
		this.showBackButton = false,
	}) : super(key: key);

	bool
	compactMode(BuildContext context)
	{
		return MediaQuery.of(context).viewInsets.bottom > 0;
	}

	Widget
	buildContent(BuildContext context)
	{
		return Column(
			mainAxisAlignment: MainAxisAlignment.center,
			crossAxisAlignment: CrossAxisAlignment.start,
			children: [
				SvgPicture.asset(
					'assets/header_art.svg',
					width: MediaQuery.of(context).size.width,
					fit: BoxFit.contain,
				),
				if (!compactMode(context)) ...[
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
			],
		);
	}

	Widget
	buildBackButton(BuildContext context)
	{
		return IconButton(
			icon: const Icon(Icons.arrow_back_ios, size: 32.0),
			onPressed: () => Navigator.pop(context),
			padding: const EdgeInsets.only(left: 20.0),
		);
	}

	Widget
	buildAppBarTitle(BuildContext context)
	{
		return Stack(
			children: [
				buildContent(context),
				buildBackButton(context),
			],
		);
	}

	@override
	AppBar
	build(BuildContext context)
	{
		return AppBar(
			title: buildAppBarTitle(context),
			titleSpacing: 0,
			centerTitle: false,
			backgroundColor: Colours.green,
			toolbarHeight: compactMode(context) ? 200 : 300,
			automaticallyImplyLeading: false,
			shape: const ContinuousRectangleBorder(
				borderRadius: BorderRadius.only(
					bottomLeft: Radius.circular(80),
					bottomRight: Radius.circular(80),
				),
			),
			shadowColor: Colors.transparent,
		);
	}

	 @override
	 // TODO: implement preferredSize
	 Size
	 get preferredSize
	 {
		return Size.fromHeight(compactMode(context) ? 200 : 300);
	 }
}