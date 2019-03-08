import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'views/loading.dart';
import 'theme/options.dart';
import 'test.dart';

class ImoocApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImoocAppState();
  }
}

class ImoocAppState extends State<ImoocApp> {
  static final String pageTitle = 'Imooc';
  static const EventChannel _eventChannel =
      const EventChannel('com.imooc/push_channel');

  showLoadingPage() {
    return LoadingPage();
  }

  @override
  void initState() {
    super.initState();
    _eventChannel.receiveBroadcastStream().listen(_onSuccess);
  }

  //flutter处理push的入口，从此处去不同的dispatcher
  void _onSuccess(Object event) {
    print(event);
  }

  @override
  Widget build(BuildContext context) {
    //构建app的loading页面
    return MaterialApp(
      title: pageTitle,
      theme: initOptions.theme.data.copyWith(platform: initOptions.platform),
      home: showLoadingPage(),
    );
  }
}

void main() {
  runApp(ImoocApp());
}
