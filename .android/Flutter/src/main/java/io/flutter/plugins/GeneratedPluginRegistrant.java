package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.deviceinfo.DeviceInfoPlugin;
import com.qndroid.plugin.httpplugin.HttpPlugin;
import com.imooc.shareplugin.SharePlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    DeviceInfoPlugin.registerWith(registry.registrarFor("io.flutter.plugins.deviceinfo.DeviceInfoPlugin"));
    HttpPlugin.registerWith(registry.registrarFor("com.qndroid.plugin.httpplugin.HttpPlugin"));
    SharePlugin.registerWith(registry.registrarFor("com.imooc.shareplugin.SharePlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
