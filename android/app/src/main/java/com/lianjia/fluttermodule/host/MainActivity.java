package com.lianjia.fluttermodule.host;

import android.content.Intent;
import android.os.Bundle;
import com.lianjia.fluttermodule.capture.TestActivity;
import com.lianjia.fluttermodule.constant.Constants;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import java.io.Console;
import java.io.Serializable;
import java.util.Map;

public class MainActivity extends FlutterActivity implements MethodChannel.MethodCallHandler {
  private static final String CHANNEL = "com.imooc/navigator";
  private static final String METHOD_START_ACTIVITY = "start_activity";
  private static final String METHOD_START_ACTIVITY_FOR_RESULT = "start_activity_for_result";

  private MethodChannel.Result mResult;

  @Override protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    //创建通信channle
    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(this);
  }

  @Override public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
    mResult = result;
    String method = methodCall.method;
    //目的activity
    String activityName = methodCall.argument(Constants.ACTIVITY_NAME);
    //目的activity参数
    Map params = null;
    if (methodCall.hasArgument(Constants.PARAMS)) {
      params = methodCall.argument(Constants.PARAMS);
    }
    switch (method) {
      case METHOD_START_ACTIVITY:
        startActivity(activityName, params);
        break;
      case METHOD_START_ACTIVITY_FOR_RESULT:
        startActivityForResult(activityName, params);
        break;
    }
  }

  private void startActivity(String activityName, Map params) {
    Intent intent = new Intent(this, TestActivity.class);
    if (params != null) intent.putExtra(Constants.PARAMS, (Serializable) params);
    startActivity(intent);
    mResult.success(null);
  }

  private void startActivityForResult(String activityName, Map params) {
    int requestCode = (int) params.get(Constants.REQUEST_CODE);
    Intent intent = new Intent(this, TestActivity.class);
    intent.putExtra(Constants.PARAMS, (Serializable) params);
    startActivityForResult(intent, requestCode);
  }

  @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    super.onActivityResult(requestCode, resultCode, data);
    if (resultCode == RESULT_OK) {
      //与flutter也以json的方式去通信，与发请求类似
      mResult.success(data.getStringExtra(Constants.RESULT));
    }
  }
}
