package com.lianjia.fluttermodule.push.events;

public class PushEvent {
  //推送来的消息json串
  public String pushMsg;

  public PushEvent(String pushMsg) {
    this.pushMsg = pushMsg;
  }
}
