package com.lianjia.fluttermodule.host;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiManager;
import android.util.Log;
import io.flutter.plugin.common.EventChannel;

public class PushStreamHandler implements EventChannel.StreamHandler {

  public static final String PUSH_CHANNEL = "com.imooc/push_channel";
  private Context mContext;
  private BroadcastReceiver mBroadcastReceiver;

  public PushStreamHandler(Context context) {
    mContext = context;
  }

  @Override public void onListen(Object o, EventChannel.EventSink eventSink) {
    mBroadcastReceiver = new PushBroadcastReceiver(eventSink);
    mContext.registerReceiver(mBroadcastReceiver,
        new IntentFilter(WifiManager.WIFI_STATE_CHANGED_ACTION));
  }

  @Override public void onCancel(Object o) {
    mContext.unregisterReceiver(mBroadcastReceiver);
    mBroadcastReceiver = null;
  }

  private static class PushBroadcastReceiver extends BroadcastReceiver {

    private EventChannel.EventSink mEventSink; //发送事件到flutter端

    public PushBroadcastReceiver(EventChannel.EventSink events) {
      mEventSink = events;
    }

    @Override public void onReceive(Context context, Intent intent) {
      if (intent.getAction() == WifiManager.WIFI_STATE_CHANGED_ACTION) {
        switch (intent.getIntExtra(WifiManager.EXTRA_WIFI_STATE, WifiManager.WIFI_STATE_UNKNOWN)) {
          case WifiManager.WIFI_STATE_DISABLED:
            mEventSink.success("WIFI不可用");
            break;
          case WifiManager.WIFI_STATE_ENABLED:
            mEventSink.success("WIFI可用");
            break;
        }
      }
    }
  }
}


