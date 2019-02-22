package com.qndroid.plugin.httpplugin.okhttp;

import com.qndroid.plugin.httpplugin.okhttp.listener.DisposeDataListener;
import com.qndroid.plugin.httpplugin.okhttp.request.CommonRequest;
import java.util.Map;

public class RequestCenter {

  //为flutter提供post请求功能
  public static void post(String url, Map params, DisposeDataListener listener) {
    CommonRequest.postRequest(url, params, listener, null);
  }

  //为flutter提供get请求功能
  public static void get(String url, Map params, DisposeDataListener listener) {
    CommonRequest.getRequest(url, params, listener, null);
  }
}
