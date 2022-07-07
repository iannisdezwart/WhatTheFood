import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:what_the_food/entities/dish.dart';
import 'package:what_the_food/utilities/api_route.dart';
import 'package:what_the_food/utilities/app_config.dart';

Future<void>
rateDish(Dish dish, num rating)
async
{
	http.Response res = await http.post(
		apiRoute('/rate-dish'),
		body: jsonEncode({
			'dishName': dish.name,
			'rating': {
				'userId': AppConfig.userId,
				'rating': rating
			}
		})
	);

	if (res.statusCode != 200)
	{
		throw Exception(res.body);
	}
}