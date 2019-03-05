import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation = new Tween(begin: 0.0, end: 1.0).animate(curvedAnimation);
//    animation.addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        controller.reverse();
//      } else if (status == AnimationStatus.dismissed) {
//        controller.forward();
//      }
    //   });
    controller.forward();
  }

  Widget build(BuildContext context) {
    //return AnimatedLogo(animation); //使用自定义的动画widget

//    return GrowTransition(
//      child: LogoWidget(),
//      animation: animation,
//    );

    return FadeTransition(
      opacity: animation,
      child: LogoWidget(),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo(this._animation, {Key key})
      : super(key: key, listenable: _animation);

  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: _animation.value,
        width: _animation.value,
        child: new FlutterLogo(),
      ),
    );
  }
}

//就是一个普通的widget
class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }
}

//捏合剂，通过AnimatedBuilder完成想要动画的Widget和动画的组合，从而做到动画与widget
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: AnimatedBuilder(
        child: child,
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return new Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}
