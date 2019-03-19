package com.lianjia.fluttermodule.push;

import com.lianjia.fluttermodule.push.events.PushEvent;
import io.flutter.plugin.common.EventChannel;
import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

/**
 * 统一处理Push消息转发到Flutter端
 */
public class PushStreamHandler implements EventChannel.StreamHandler {

  public static final String PUSH_CHANNEL = "com.imooc/push_channel";
  private EventChannel.EventSink mEventSink;

  @Override public void onListen(Object o, EventChannel.EventSink eventSink) {
    EventBus.getDefault().register(this);
    mEventSink = eventSink;
  }

  @Override public void onCancel(Object o) {
    EventBus.getDefault().unregister(this);
  }

  @Subscribe(threadMode = ThreadMode.MAIN) public void onMessageEvent(PushEvent event) {
    mEventSink.success(event.pushMsg);
  }
}


