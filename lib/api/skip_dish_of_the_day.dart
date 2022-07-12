import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/utilities/api_route.dart';
import 'package:what_the_food/utilities/app_config.dart';

Future<Dish>
skipDishOfTheDay()
async
{
	http.Response res = await http.post(
		apiRoute('/skip-dish-of-the-day'),
		body: jsonEncode({
			'userId': AppConfig.userId
		}),
	);

	if (res.statusCode != 200)
	{
		throw Exception(res.body);
	}

	return Dish.fromJson(jsonDecode(res.body));
}