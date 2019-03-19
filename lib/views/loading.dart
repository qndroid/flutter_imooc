//app的loading页面

import 'package:flutter/material.dart';
import 'home.dart';
import '../theme/constants.dart';
import '../sp/sp.dart';
import 'introduct.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoadingPageState();
  }
}

class LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> alpha;
  var _animationStateListener;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animationStateListener = (status) {
      if (status == AnimationStatus.completed) {
        //动画结束时跳转新页面
        SpPlugin.getBoolean(SpPlugin.IS_SHOW_GUIDE).then(
          (isShow) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => isShow ? IntroPage() : IntroPage()),
                (route) => route == null);

            SpPlugin.putBoolean(SpPlugin.IS_SHOW_GUIDE, true);
          },
        );
      }
    };
    _animationController
        .addStatusListener((status) => _animationStateListener(status));
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        SPLASH_IMAGE,
        fit: BoxFit.fill,
      ),
    );
  }
}
