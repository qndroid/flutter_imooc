import 'package:http_plugin/http_plugin.dart';
import 'dart:convert';
import '../model/home_model.dart';
import '../model/check_version_model.dart';
import '../model/user_model.dart';
import '../model/search_model.dart';

Future<HomeData> getHomeData() async {
  //模拟请求参数
  var demoData = {
    "url": "http://api.imooc.com/get_home_data",
  };
  final String result = await HttpPlugin.post(demoData);
  return HomeData.fromJson(json.decode(result));
}

Future<CheckVersionData> checkAppVersion() async {
  //模拟请求参数
  var data = {
    "url": "http://api.imooc.com/check_version",
  };
  final String result = await HttpPlugin.get(data);
  return CheckVersionData.fromJson(json.decode(result));
}

Future<User> login(username, pwd) async {
  //模拟请求参数
  var data = {
    "url": "http://api.imooc.com/login",
    "params": {
      "user_name": username,
      "password": pwd,
    }
  };
  final String result = await HttpPlugin.post(data);
  return User.fromJson(json.decode(result));
}

Future<SearchModel> search(key) async {
  //模拟请求参数
  var data = {
    "url": "http://api.imooc.com/search",
    "params": {
      "key": key,
    }
  };
  final String result = await HttpPlugin.get(data);
  return SearchModel.fromJson(json.decode(result));
}
