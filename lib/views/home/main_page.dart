import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../commponents/frame_animation.dart';
import '../../theme/constants.dart';
import '../search.dart';
import '../category/category.dart';
import '../../theme/style.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  static const platform = const MethodChannel('com.imooc/navigator');

  Future<String> _startCaptureActivity() async {
    var result;
    try {
      //跳转到原生页面并获取返回数据
      result = await platform.invokeMethod('start_qr_code', {
        'params': {'user_name': 'flutter', 'request_code': 0}
      });
    } on PlatformException catch (e) {}

    //打印扫码结果
    return result;
  }

  Widget _getTitleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: SizedBox(
            width: 22,
            height: 22,
            child: Image.asset(QRCODE_ICON),
          ),
          onTapDown: (TapDownDetails details) {
            _startCaptureActivity();
          },
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 8),
            child: GestureDetector(
              onTapDown: (TapDownDetails details) {
                //进入搜索页面
                Navigator.push(
                    context,
                    new PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      // 跳转的路由对象
                      return SearchPage();
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation, // 默认的路由动画
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return createRight2LeftTransition(animation, child);
                    }));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Center(
                  child: Text(
                    HOME_PAGE_SEARCH_HINT, //此处后面改成使用主题中的颜色，否则不能做到动态换主题
                    style: TextStyle(
                        color: Theme.of(context).hintColor, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          child: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(CAT_ICON),
          ),
          onTapDown: (TapDownDetails details) {
            //也可以提取出来优化
            Navigator.push(
                context,
                new PageRouteBuilder(pageBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  // 跳转的路由对象
                  return CategoryPage();
                }, transitionsBuilder: (
                  BuildContext context,
                  Animation<double> animation, // 默认的路由动画
                  Animation<double> secondaryAnimation,
                  Widget child,
                ) {
                  return createRight2LeftTransition(animation, child);
                }));
          },
        )
      ],
    );
  }

  Widget _getProgressWidget() {
    return FrameAnimationImage(
      assetList,
      width: 125,
      height: 125,
      interval: 80,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _getTitleWidget(),
        elevation: 0,
      ),
      body: Center(
        child: _getProgressWidget(),
      ),
    );
  }
}
