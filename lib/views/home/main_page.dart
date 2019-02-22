import 'package:flutter/material.dart';
import '../../commponents/frame_animation.dart';
import '../../theme/constants.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  final List<String> _assetList = [
    PAGE_LOADING_ICON_01,
    PAGE_LOADING_ICON_02,
    PAGE_LOADING_ICON_03,
    PAGE_LOADING_ICON_04,
    PAGE_LOADING_ICON_05,
    PAGE_LOADING_ICON_06,
    PAGE_LOADING_ICON_07,
    PAGE_LOADING_ICON_08,
    PAGE_LOADING_ICON_09,
  ];

  Widget _getTitleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 22,
          height: 22,
          child: Image.asset(QRCODE_ICON),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 8),
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
        SizedBox(
          width: 24,
          height: 24,
          child: Image.asset(CAT_ICON),
        ),
      ],
    );
  }

  Widget _getProgressWidget() {
    return FrameAnimationImage(
      _assetList,
      width: 125,
      height: 125,
      interval: 80,
    );
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
