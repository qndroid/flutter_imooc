package com.lianjia.fluttermodule.host.application;

import cn.jpush.android.api.JPushInterface;
import io.flutter.app.FlutterApplication;

public class ImoocApplication extends FlutterApplication {

  private static ImoocApplication instance = null;

  @Override public void onCreate() {
    super.onCreate();
    instance = this;

    JPushInterface.setDebugMode(true);  // 设置开启日志,发布时请关闭日志
    JPushInterface.init(this);
  }

  public static ImoocApplication getInstance() {
    return instance;
  }
}
