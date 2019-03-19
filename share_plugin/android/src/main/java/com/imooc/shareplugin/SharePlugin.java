package com.imooc.shareplugin;

import android.content.Context;
import android.util.Log;
import cn.sharesdk.framework.Platform;
import cn.sharesdk.framework.PlatformActionListener;
import com.imooc.shareplugin.share.ShareData;
import com.imooc.shareplugin.share.ShareManager;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import java.util.HashMap;
import java.util.Map;

/** SharePlugin */
public class SharePlugin implements MethodCallHandler {
  //分享常量
  private static final String SHARE_PARAMS = "share_params";
  private static final String SHARE_QQ = "QQ";
  private static final String SHARE_QZONE = "QZONE";
  private static final String SHARE_WEIXIN = "WEIXIN";
  private static final String SHARE_WEIXIN_MOMENT = "WEIXIN_MOMENT";

  private final Registrar mRegistrar;
  private final MethodChannel mMethodChannel;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "share_plugin");
    channel.setMethodCallHandler(new SharePlugin(registrar, channel));
  }

  private SharePlugin(Registrar registrar, MethodChannel channel) {
    this.mRegistrar = registrar;
    this.mMethodChannel = channel;
    init(registrar.activity().getApplicationContext());
  }

  //初始化友盟SDK
  private void init(Context context) {
    ShareManager.initSDK(context);
  }

  @Override public void onMethodCall(MethodCall call, Result result) {
    String method = call.method;
    ShareData mData = new ShareData();
    Platform.ShareParams params = new Platform.ShareParams();
    params.setShareType(Integer.parseInt((String) call.argument("type")));
    params.setTitle((String) call.argument("title"));
    params.setTitleUrl((String) call.argument("title_url"));
    params.setSite((String) call.argument("site"));
    params.setSiteUrl((String) call.argument("site_url"));
    params.setText((String) call.argument("text"));
    params.setImagePath((String) call.argument("photo"));
    params.setUrl((String) call.argument("url"));
    mData.mShareParams = params;
    switch (method) {
      case SHARE_QQ:
        mData.mPlatformType = ShareManager.PlatofrmType.QQ;
        shareData(mData, result);
        break;
      case SHARE_QZONE:
        mData.mPlatformType = ShareManager.PlatofrmType.QZone;
        shareData(mData, result);
        break;
      case SHARE_WEIXIN:
        mData.mPlatformType = ShareManager.PlatofrmType.WeChat;
        shareData(mData, result);
        break;
      case SHARE_WEIXIN_MOMENT:
        mData.mPlatformType = ShareManager.PlatofrmType.WechatMoments;
        shareData(mData, result);
        break;
    }
  }

  private void shareData(ShareData data, final Result result) {
    ShareManager.getInstance().shareData(data, new PlatformActionListener() {
      @Override public void onComplete(Platform platform, int i, HashMap<String, Object> hashMap) {
        result.success("success");
      }

      @Override public void onError(Platform platform, int i, Throwable throwable) {
        result.error("error", "error", throwable);
      }

      @Override public void onCancel(Platform platform, int i) {
        result.error("error", "cancel", null);
      }
    });
  }
}
