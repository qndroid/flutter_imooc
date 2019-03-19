package com.lianjia.fluttermodule.host;

import android.content.Intent;
import android.os.Bundle;
import com.lianjia.fluttermodule.constant.Constants;
import com.lianjia.fluttermodule.push.PushStreamHandler;
import com.lianjia.fluttermodule.sp.SPStreamHandler;
import com.lianjia.fluttermodule.utils.PermissionUtils;
import com.youdu.zxing.app.CaptureActivity;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import java.util.Map;

public class MainActivity extends FlutterActivity implements MethodChannel.MethodCallHandler {

  private static final int REQUEST_QRCODE = 0x01;
  private static final String CHANNEL = "com.imooc/navigator";
  private static final String METHOD_START_QR_CODE = "start_qr_code";

  private MethodChannel.Result mResult;

  @Override protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    //创建方法通信channle
    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(this);
    //创建事件通信channel
    new EventChannel(getFlutterView(), PushStreamHandler.PUSH_CHANNEL).setStreamHandler(
        new PushStreamHandler());
    //调用主工程的sp存数据，native如何使用封装的plugin
    new MethodChannel(getFlutterView(), SPStreamHandler.SP_CHANNEL).setMethodCallHandler(
        new SPStreamHandler());
  }

  @Override public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
    mResult = result;
    String method = methodCall.method;
    //目的activity参数
    Map params = null;
    if (methodCall.hasArgument(Constants.PARAMS)) {
      params = methodCall.argument(Constants.PARAMS);
    }
    switch (method) {
      case METHOD_START_QR_CODE:
        gotoCaptuareActivity();
        break;
    }
  }

  //跳转到扫码activity
  private void gotoCaptuareActivity() {
    if (PermissionUtils.hasPermission(this, PermissionUtils.HARDWEAR_CAMERA_PERMISSION)) {
      //已取得权限
      Intent intent = new Intent(this, CaptureActivity.class);
      startActivityForResult(intent, REQUEST_QRCODE);
    } else {
      PermissionUtils.requestPermission(this, PermissionUtils.HARDWEAR_CAMERA_CODE,
          PermissionUtils.HARDWEAR_CAMERA_PERMISSION);
    }
  }

  //获取其它页面返回结果处理
  @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    super.onActivityResult(requestCode, resultCode, data);
    if (resultCode == RESULT_OK) {
      //与flutter也以json的方式去通信，与发请求类似
      mResult.success(data.getStringExtra(Constants.RESULT));
    }
  }

  //获取权限后的逻辑处理
  @Override public void onRequestPermissionsResult(int requestCode, String[] permissions,
      int[] grantResults) {
    super.onRequestPermissionsResult(requestCode, permissions, grantResults);
    switch (requestCode) {
      case PermissionUtils.HARDWEAR_CAMERA_CODE:
        //已取得权限
        Intent intent = new Intent(this, CaptureActivity.class);
        startActivityForResult(intent, REQUEST_QRCODE);
        break;
    }
  }
}
