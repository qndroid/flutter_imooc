import 'dart:async';

import 'package:flutter/services.dart';

class HttpPlugin {
  static const MethodChannel _channel = const MethodChannel('http_plugin');

  static Future<String> post(payload) async {
    final String result = await _channel.invokeMethod('post', payload);
    return result;
  }

  static Future<String> get(payload) async {
    final String result = await _channel.invokeMethod('get', payload);
    return result;
  }
}
