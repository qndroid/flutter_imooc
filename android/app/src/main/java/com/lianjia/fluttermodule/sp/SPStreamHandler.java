package com.lianjia.fluttermodule.sp;

import com.lianjia.fluttermodule.constant.Constants;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.util.Map;

public class SPStreamHandler implements MethodChannel.MethodCallHandler {

  public static final String SP_CHANNEL = "com.imooc/sp_channel";
  private static final String METHOD_GET_BOOLEAN = "getBoolean";
  private static final String METHOD_PUT_BOOLEAN = "putBoolean";
  private static final String METHOD_GET_INT = "getInt";
  private static final String METHOD_PUT_INT = "putInt";
  private static final String METHOD_GET_FLOAT = "getFloat";
  private static final String METHOD_PUT_FLOAT = "putFloat";
  private static final String METHOD_GET_LONG = "getLong";
  private static final String METHOD_PUT_LONG = "putLong";
  private static final String METHOD_GET_STRING = "getString";
  private static final String METHOD_PUT_STRING = "putString";
  private static final String METHOD_IS_KEY_EXISTS = "isKeyExist";
  private static final String METHOD_KEY_REMOVED = "remove";
  private static final String METHOD_KEY = "key";
  private static final String METHOD_VALUE = "value";

  @Override public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
    String method = methodCall.method;
    //目的activity参数
    Map params = null;
    if (methodCall.hasArgument(Constants.PARAMS)) {
      params = methodCall.argument(Constants.PARAMS);
    }
    String key = (String) params.get(METHOD_KEY);
    switch (method) {
      case METHOD_GET_BOOLEAN:
        result.success(SPManager.getInstance().getBoolean(key, false));
        break;
      case METHOD_PUT_BOOLEAN:
        SPManager.getInstance().putBoolean(key, (boolean) params.get(METHOD_VALUE));
        break;
      case METHOD_GET_INT:
        result.success(SPManager.getInstance().getInt(key, -1));
        break;
      case METHOD_PUT_INT:
        SPManager.getInstance().putInt(key, (int) params.get(METHOD_VALUE));
        break;
      case METHOD_GET_FLOAT:
        result.success(SPManager.getInstance().getFloat(key, -1.0f));
        break;
      case METHOD_PUT_FLOAT:
        SPManager.getInstance().putFloat(key, (float) params.get(METHOD_VALUE));
        break;
      case METHOD_GET_LONG:
        result.success(SPManager.getInstance().getLong(key, -1));
        break;
      case METHOD_PUT_LONG:
        SPManager.getInstance().putLong(key, (long) params.get(METHOD_VALUE));
        break;
      case METHOD_GET_STRING:
        result.success(SPManager.getInstance().getString(key, null));
        break;
      case METHOD_PUT_STRING:
        SPManager.getInstance().putString(key, (String) params.get(METHOD_VALUE));
        break;
      case METHOD_KEY_REMOVED:
        SPManager.getInstance().remove(key);
        break;
      case METHOD_IS_KEY_EXISTS:
        result.success(SPManager.getInstance().isKeyExist(key));
        break;
    }
  }
}
