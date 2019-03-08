package com.lianjia.fluttermodule.push;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import cn.jpush.android.api.JPushInterface;
import com.lianjia.fluttermodule.capture.TestActivity;
import com.lianjia.fluttermodule.push.events.PushEvent;
import java.util.Iterator;
import org.greenrobot.eventbus.EventBus;
import org.json.JSONException;
import org.json.JSONObject;

public class PushReceiver extends BroadcastReceiver {
  private static final String TAG = PushReceiver.class.getSimpleName();

  @Override public void onReceive(Context context, Intent intent) {
    try {
      Bundle bundle = intent.getExtras();
      if (JPushInterface.ACTION_REGISTRATION_ID.equals(intent.getAction())) {
        String regId = bundle.getString(JPushInterface.EXTRA_REGISTRATION_ID);
        Log.d(TAG, "[MyReceiver] 接收Registration Id : " + regId);
      } else if (JPushInterface.ACTION_NOTIFICATION_RECEIVED.equals(intent.getAction())) {
        Log.d(TAG, "[MyReceiver] 接收到推送下来的通知");
        int notifactionId = bundle.getInt(JPushInterface.EXTRA_NOTIFICATION_ID);
        Log.d(TAG, "[MyReceiver] 接收到推送下来的通知的ID: " + notifactionId);
      } else if (JPushInterface.ACTION_NOTIFICATION_OPENED.equals(intent.getAction())) {
        //转发消息到PushStreamHandler
        EventBus.getDefault().post(new PushEvent(getPushData(bundle)));
      }
    } catch (Exception e) {

    }
  }

  private String getPushData(Bundle bundle) throws JSONException {
    JSONObject json = new JSONObject();
    for (String key : bundle.keySet()) {
      if (key.equals(JPushInterface.EXTRA_EXTRA)) {
        if (TextUtils.isEmpty(bundle.getString(JPushInterface.EXTRA_EXTRA))) {
          continue;
        }
        json = new JSONObject(bundle.getString(JPushInterface.EXTRA_EXTRA));
      }
    }
    return json.toString();
  }
}
