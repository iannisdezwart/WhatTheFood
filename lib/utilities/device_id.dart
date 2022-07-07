import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

Future<String?>
deviceId()
async
{
	final deviceInfo = DeviceInfoPlugin();

	if (Platform.isIOS)
	{
		final iosInfo = await deviceInfo.iosInfo;
		return iosInfo.identifierForVendor;
	}
	else if (Platform.isAndroid)
	{
		final androidInfo = await deviceInfo.androidInfo;
		return androidInfo.androidId;
	}

	throw Exception('Unsupported platform');
}