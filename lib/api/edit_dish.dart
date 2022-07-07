import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/utilities/api_route.dart';

Future<void>
editDish(String dishName, NewDish updatedDish)
async
{
	http.Response res = await http.post(
		apiRoute('/edit-dish'),
		body: jsonEncode({
			'dishName': dishName,
			'updatedDish': updatedDish.toJSON(),
		}),
	);

	if (res.statusCode != 200)
	{
		throw Exception(res.body);
	}
}