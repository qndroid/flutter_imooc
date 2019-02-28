import 'package:flutter/material.dart';

//定义整个app中所有的样式，重点是文字的
final itemTitleStyle = TextStyle(color: Colors.black, fontSize: 18);

final itemSubTitleStyle = TextStyle(color: Color(0xff333333), fontSize: 14);

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
