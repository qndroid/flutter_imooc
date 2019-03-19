import 'dart:async';

import 'package:flutter/services.dart';

/*
 * 类似于plugin中对外提供的接口
 */
class SpPlugin {
  static const String IS_SHOW_GUIDE = 'is_show_guide';

  static const MethodChannel _channel =
      const MethodChannel('com.imooc/sp_channel');

  static Future<bool> getBoolean(key) async {
    final bool result = await _channel.invokeMethod(
      'getBoolean',
      {
        'params': {'key': key}
      },
    );
    return result;
  }

  static Future<void> putBoolean(key, value) async {
    var payload = {
      'params': {'key': key, 'value': value}
    };
    await _channel.invokeMethod('putBoolean', payload);
  }

  static Future<bool> isKeyExists(key) async {
    final bool result = await _channel.invokeMethod(
      'isKeyExist',
      {
        'params': {'key': key}
      },
    );
    return result;
  }
}
