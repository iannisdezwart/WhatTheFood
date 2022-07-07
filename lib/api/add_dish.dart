import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/utilities/api_route.dart';

Future<void>
addDish(NewDish dish)
async
{
	http.Response res = await http.post(
		apiRoute('/add-dish'),
		body: jsonEncode(dish.toJSON()),
	);

	if (res.statusCode != 200)
	{
		throw Exception(res.body);
	}
}