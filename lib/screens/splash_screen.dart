import 'package:flutter/material.dart';
import 'package:what_the_food/api/dish_of_the_day.dart';
import 'package:what_the_food/colours.dart';
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/screens/home_page.dart';
import 'package:what_the_food/utilities/app_config.dart';
import 'package:what_the_food/utilities/device_id.dart';

class SplashScreen extends StatefulWidget
{
	const SplashScreen({ Key? key }) : super(key: key);

	@override
	State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
	Future<void>
	setUserId()
	async
	{
		AppConfig.userId = await deviceId();
	}

	Future<void>
	getDishOfTheDayAndGoToHomeScreen()
	async
	{
		Dish dish = await getDishOfTheDay();

		if (!mounted)
		{
			return;
		}

		Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(dishOfTheDay: dish)));
	}

	@override
	Widget
	build(BuildContext context)
	{
		setUserId();
		getDishOfTheDayAndGoToHomeScreen();

		return const Scaffold(
			backgroundColor: Colours.green,
			body: Center(
				child: Text(
					'What The Food?!',
					style: TextStyle(
						fontSize: 40,
						fontWeight: FontWeight.bold,
						color: Colors.white,
					),
				),
			),
		);
	}
}