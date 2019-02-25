import 'package:flutter/material.dart';
import '../../theme/options.dart';
import '../../theme/style.dart';
import '../../theme/constants.dart';
import 'package:share_plugin/share_plugin.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MinePageState();
  }
}

class MinePageState extends State<MinePage> {
  ThemeData _getThemeData() {
    return initOptions.theme.data.copyWith(
        platform: initOptions.platform,
        primaryColor: Colors.white,
        brightness: Brightness.dark);
  }

  Widget _getUserInfoWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 80,
            height: 80,
            child: CircleAvatar(
              child: Image.asset(
                USER_DEFAULT_ICON,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                USER_UNLOGIN_TIP,
                style: itemSubTitleStyle,
              ),
            ),
          ),
          Container(
            width: 90,
            height: 43,
            color: Color(0xFFFED952),
            child: Center(
              child: Text(
                USER_LOGIN_TIP,
                style: itemTitleStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  //显示分享对话框
  void _showShareDialog(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          //builder是一个返回一个widget的函数
          return ShareWidget();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _getThemeData(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            _getUserInfoWidget(),
            Container(
              height: 10,
              color: Color(0xFFCCCCCC),
            ),
            FunctionItemWidget._(
              VIDEO_SETTING_TIP,
              true,
              20,
            ),
            FunctionItemWidget._(
              SHARE_SETTING_TIP,
              true,
              20,
              callback: (TapDownDetails details) {
                _showShareDialog(context);
              },
            ),
            FunctionItemWidget._(
              MY_QRCODE_TIP,
              true,
              20,
            ),
            FunctionItemWidget._(
              APP_UPDATE_TIP,
              true,
              0,
            ),
          ],
        ),
      ),
    );
  }
}

class FunctionItemWidget extends StatelessWidget {
  FunctionItemWidget._(this.title, this.showDivider, this.padding,
      {this.callback});

  final String title;
  final bool showDivider;
  final double padding;
  final GestureTapDownCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: callback,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    style: itemSubTitleStyle,
                  ),
                ),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          showDivider
              ? Padding(
                  padding: EdgeInsets.only(left: padding),
                  child: Divider(
                    height: 0.5,
                    color: Theme.of(context).hintColor,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class ShareWidget extends StatelessWidget {
  var payload = {
    'type': '2',
    'title': '慕课网',
    'title_url': 'http://www.imooc.com',
    'site': 'imooc',
    'site_url': 'http://www.imooc.com'
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 15)),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10)),
              ShareItemWidget._(
                SHARE_WEIXIN_ICON,
                SHARE_WEIXIN_NAME,
                callback: (TapDownDetails details) {
                  SharePlugin.share(SHARE_WEIXIN, payload);
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
              ),
              ShareItemWidget._(
                SHARE_MOMENT_ICON,
                SHARE_MOMENT_NAME,
                callback: (TapDownDetails details) {
                  SharePlugin.share(SHARE_WEIXIN_MOMENT, payload);
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
              ),
              ShareItemWidget._(
                SHARE_QQ_ICON,
                SHARE_QQ_NAME,
                callback: (TapDownDetails details) {
                  SharePlugin.share(SHARE_QQ, payload);
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
              ),
              ShareItemWidget._(
                SHARE_QZONE_ICON,
                SHARE_QZONE_NAME,
                callback: (TapDownDetails details) {
                  SharePlugin.share(SHARE_QZONE, payload);
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
          ),
          Divider(
            height: 0.5,
            color: Theme.of(context).hintColor,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 10),
            child: SizedBox(
              height: 30,
              child: Text(CANCEL_NAME),
            ),
          ),
        ],
      ),
    );
  }
}

//分享组件中的每一小项
class ShareItemWidget extends StatelessWidget {
  ShareItemWidget._(this.icon, this.name, {this.callback});

  final String icon;
  final String name;
  final GestureTapDownCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset(icon),
          ),
          Text(
            name,
            style: itemSubTitleStyle,
          )
        ],
      ),
      onTapDown: callback,
    );
  }
}
