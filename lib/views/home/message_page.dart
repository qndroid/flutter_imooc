import 'package:flutter/material.dart';
import '../../theme/options.dart';
import '../../theme/style.dart';
import '../../theme/constants.dart';

class MessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MessagePageState();
  }
}

//本页面的主题
class MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    //通过Theme主题灵活定义每个页面不同于app主题的地方,后续动态修改，现在是写死的一种，
    // 这些灵散的颜色都应该从已经定义的themedata中取
    ThemeData _getThemeData() {
      return initOptions.theme.data.copyWith(
          platform: initOptions.platform, primaryColor: Color(0xFFe3e3e3));
    }

    return Theme(
        data: _getThemeData(),
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              title: Center(
                child: Text(
                  MESSAGE_TITLE,
                  style: TextStyle(color: Color(0xff333333), fontSize: 22),
                ),
              )),
          body: Column(children: <Widget>[
            MessageItemWidget._(
                MESSAGE_TITLE, MESSAGE_TIP, CHART_ICON, Colors.blue),
            Divider(
              height: 0.5,
              color: Theme.of(context).hintColor,
            ),
            MessageItemWidget._(
                MESSAGE_ZAN, MESSAGE_ZAN_TIP, ZAN_ICON, Colors.lightGreen),
            Divider(
              height: 0.5,
              color: Theme.of(context).hintColor,
            ),
            MessageItemWidget._(
                MESSAGE_IMOOC, MESSAGE_IMOOC_TIP, IMOOC_ICON, Colors.yellow),
            Divider(
              height: 0.5,
              color: Theme.of(context).hintColor,
            ),
          ]),
        ));
  }
}

class MessageItemWidget extends StatelessWidget {
  MessageItemWidget._(this.title, this.subTitle, this.icon, this.bgColor);

  final String title;
  final String subTitle;
  final String icon;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Row(children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    child: Image.asset(icon),
                    backgroundColor: bgColor,
                  )),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title, style: itemTitleStyle),
                    Padding(padding: EdgeInsets.only(top: 7)),
                    Text(
                      subTitle,
                      style: itemSubTitleStyle,
                    ),
                  ])),
        ]));
  }
}
