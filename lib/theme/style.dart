import 'package:flutter/material.dart';
import '../theme/constants.dart';
import '../theme/options.dart';
import '../commponents/frame_animation.dart';

//定义整个app中所有的样式，重点是文字的
final itemTitleStyle = TextStyle(color: Colors.black, fontSize: 18);

final itemSubTitleStyle = TextStyle(color: Color(0xff333333), fontSize: 14);

final itemSmallTitleStyle = TextStyle(color: Color(0xff333333), fontSize: 13);

//从右向左滑入
SlideTransition createRight2LeftTransition(
    Animation<double> animation, Widget child) {
  return new SlideTransition(
    position: new Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(animation),
    child: child,
  );
}

//公共loading widget
Widget getProgressWidget() {
  return Center(
      child: FrameAnimationImage(
    assetList,
    width: 125,
    height: 125,
    interval: 80,
  ));
}

ThemeData getWhiteTheme() {
  return initOptions.theme.data.copyWith(
    platform: initOptions.platform,
    primaryColor: Colors.white,
  );
}
