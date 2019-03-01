//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <device_info/DeviceInfoPlugin.h>
#import <http_plugin/HttpPlugin.h>
#import <share_plugin/SharePlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTDeviceInfoPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTDeviceInfoPlugin"]];
  [HttpPlugin registerWithRegistrar:[registry registrarForPlugin:@"HttpPlugin"]];
  [SharePlugin registerWithRegistrar:[registry registrarForPlugin:@"SharePlugin"]];
}

@end
