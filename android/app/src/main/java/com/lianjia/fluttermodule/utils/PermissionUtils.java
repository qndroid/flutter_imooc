package com.lianjia.fluttermodule.utils;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;

public class PermissionUtils {

  public static final int HARDWEAR_CAMERA_CODE = 0x02;
  public static final String[] HARDWEAR_CAMERA_PERMISSION =
      new String[] { Manifest.permission.CAMERA };

  /**
   * 申请指定的权限.
   */
  public static void requestPermission(Activity activity, int code, String... permissions) {

    ActivityCompat.requestPermissions(activity, permissions, code);
  }

  /**
   * 判断是否有指定的权限
   */
  public static boolean hasPermission(Context context, String... permissions) {

    for (String permisson : permissions) {
      if (ContextCompat.checkSelfPermission(context, permisson)
          != PackageManager.PERMISSION_GRANTED) {
        return false;
      }
    }
    return true;
  }
}
