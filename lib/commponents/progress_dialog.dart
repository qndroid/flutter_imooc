import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressDialog extends StatelessWidget {
  //子布局
  final Widget child;

  //加载中是否显示
  final bool loading;

  //进度提醒内容
  final String msg;

  //加载中动画
  final Widget progress;

  //背景透明度
  final double alpha;

  //字体颜色
  final Color textColor;

  ProgressDialog(
      {Key key,
      @required this.loading,
      this.msg,
      this.progress = const CircularProgressIndicator(),
      this.alpha = 0.6,
      this.textColor = Colors.white,
      @required this.child})
      : assert(child != null),
        assert(loading != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (loading) {
      Widget layoutProgress;
      if (msg == null) {
        layoutProgress = Center(
          child: progress,
        );
      } else {
        layoutProgress = Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(4.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                progress,
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                  child: Text(
                    msg,
                    style: TextStyle(color: textColor, fontSize: 16.0),
                  ),
                )
              ],
            ),
          ),
        );
      }
      widgetList.add(
        Opacity(
          opacity: alpha,
          child: new ModalBarrier(color: Colors.black87),
        ),
      );
      widgetList.add(layoutProgress);
    }
    return Stack(
      children: widgetList,
    );
  }
}

//加载的样式
class LoadingProgress extends StatefulWidget {
  final Size size;
  final Color color;
  final int count;
  final int milliseconds;

  const LoadingProgress(
      {@required this.size,
      this.milliseconds: 300,
      this.color: Colors.green,
      this.count: 4});

  @override
  State<StatefulWidget> createState() => _ProgressState();
}

class _ProgressState extends State<LoadingProgress>
    with TickerProviderStateMixin {
  List<Animation<double>> animators = [];
  List<AnimationController> _animationControllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.count; i++) {
      var animationController = new AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.milliseconds * widget.count));
      animationController.value = 0.8 * i / widget.count;
      _animationControllers.add(animationController);
      Animation<double> animation =
          new Tween(begin: 0.1, end: 1.9).animate(animationController);
      animators.add(animation);
    }
    animators[0].addListener(_change);
    try {
      var mi = (widget.milliseconds ~/ (2 * animators.length - 2));
      for (int i = 0; i < animators.length; i++) {
        print((mi * i).toString());
        dodelay(_animationControllers[i], mi * i);
      }
    } on Exception {}
  }

  void dodelay(AnimationController _animationControllers, int delay) async {
    Future.delayed(Duration(milliseconds: delay), () {
      _animationControllers..repeat().orCancel;
    });
  }

  void _change() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      painter: _Progress(
          animators: animators, color: widget.color, count: widget.count),
      size: widget.size,
    );
  }

  @override
  void dispose() {
    super.dispose();
    animators[0].removeListener(_change);
    _animationControllers[0].dispose();
  }
}

class _Progress extends CustomPainter {
  final Color color;
  final int count;
  final List<Animation<double>> animators;

  const _Progress({this.animators, this.color, this.count});

  @override
  void paint(Canvas canvas, Size size) {
    var radius = size.width / (3 * count + 1);
    var paint = new Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    for (int i = 1; i < count + 1; i++) {
      double value = animators[i - 1].value;
      canvas.drawCircle(new Offset(radius * i * 3 - radius, size.height / 2),
          radius * (value > 1 ? (2 - value) : value), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
