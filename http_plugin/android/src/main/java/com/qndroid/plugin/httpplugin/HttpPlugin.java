package com.qndroid.plugin.httpplugin;

import com.qndroid.plugin.httpplugin.okhttp.HttpConstant;
import com.qndroid.plugin.httpplugin.okhttp.RequestCenter;
import com.qndroid.plugin.httpplugin.okhttp.listener.DisposeDataListener;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import java.util.Map;

/** HttpPlugin */
public class HttpPlugin implements MethodCallHandler {
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "http_plugin");
    channel.setMethodCallHandler(new HttpPlugin());
  }

  @Override public void onMethodCall(MethodCall call, final Result result) {
    String method = call.method;
    String url = call.argument(HttpConstant.PARAM_URL);
    Map params = null;
    if (call.hasArgument(HttpConstant.PARAM_PARAMS)) {
      params = call.argument(HttpConstant.PARAM_PARAMS);
    }
    switch (method) {
      case HttpConstant.METHOD_POST:
        handleFlutterPostRequest(url, params, result);
        break;
      case HttpConstant.METHOD_GET:
        handleFlutterGetRequest(url, params, result);
        break;
      default:
        result.notImplemented();
    }
  }

  /**
   * 这两个方法有点耦合，可以合二为一，先这样，如果业务差别大还是要分开
   */
  private void handleFlutterPostRequest(String url, Map params, final Result result) {
    RequestCenter.post(url, params, new DisposeDataListener() {
      @Override public void onSuccess(Object responseObj) {
        //把请求结果桥接到flutter端，只能是json,不能是实体对象
        result.success(responseObj);
      }

      @Override public void onFailure(Object reasonObj) {
        result.error("error", "request failed", reasonObj.toString());
      }
    });
  }

  private void handleFlutterGetRequest(String url, Map params, final Result result) {
    RequestCenter.get(url, params, new DisposeDataListener() {
      @Override public void onSuccess(Object responseObj) {
        //把请求结果桥接到flutter端
        result.success(responseObj);
      }

      @Override public void onFailure(Object reasonObj) {
        result.error("error", "request failed", reasonObj.toString());
      }
    });
  }
}
