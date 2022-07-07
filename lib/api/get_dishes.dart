import 'dart:convert';

import 'package:what_the_food/entities/dish.dart';
import 'package:http/http.dart' as http;
import 'package:what_the_food/utilities/api_route.dart';
import 'package:what_the_food/utilities/app_config.dart';

Future<List<Dish>>
getDishes()
async
{
	http.Response res = await http.get(apiRoute(
		'/get-dishes',
		params: {
			'userId': AppConfig.userId
		}
	));

	if (res.statusCode != 200)
	{
		throw Exception(res.body);
	}

	List<Dish> dishes = [];
	List<dynamic> json = jsonDecode(res.body);

	for (dynamic dish in json)
	{
		dishes.add(Dish.fromJson(dish));
	}

	return dishes;
}