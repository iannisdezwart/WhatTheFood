import 'package:what_the_food/utilities/app_config.dart';

Uri
apiRoute(String route, { Map<String, String?>? params })
{
	if (params == null)
	{
		return Uri.parse(AppConfig.apiUrl + route);
	}

	String url = '${AppConfig.apiUrl}$route?';

	for (int i = 0; i < params.length; i++)
	{
		url += '${params.keys.elementAt(i)}=${params.values.elementAt(i)}';

		if (i < params.length - 1)
		{
			url += '&';
		}
	}

	return Uri.parse(url);
}