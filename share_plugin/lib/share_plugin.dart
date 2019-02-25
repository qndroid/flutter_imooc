import 'dart:async';

import 'package:flutter/services.dart';

class SharePlugin {
  static const MethodChannel _channel = const MethodChannel('share_plugin');

  static Future<String> share(platform, payload) async {
    final String result = await _channel.invokeMethod(platform, payload);
    return result;
  }
}
