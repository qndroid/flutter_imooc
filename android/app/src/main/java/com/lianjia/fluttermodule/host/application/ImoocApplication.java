package com.lianjia.fluttermodule.host.application;

import cn.jpush.android.api.JPushInterface;
import io.flutter.app.FlutterApplication;

public class ImoocApplication extends FlutterApplication {
  @Override public void onCreate() {
    super.onCreate();

    JPushInterface.setDebugMode(true);  // 设置开启日志,发布时请关闭日志
    JPushInterface.init(this);
  }
}
