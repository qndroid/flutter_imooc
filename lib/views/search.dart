import 'package:flutter/material.dart';
import '../theme/options.dart';
import '../theme/constants.dart';
import '../theme/style.dart';
import '../request/api.dart';
import '../model/search_model.dart';

//搜索联想页面
class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  SearchModel _searchModel;

  //这个方法多次重复写了，应该可以入到theme里。
  ThemeData _getThemeData() {
    return initOptions.theme.data.copyWith(
        platform: initOptions.platform,
        primaryColor: Colors.white,
        brightness: Brightness.dark);
  }

  Future<void> _handleSearch(String key) async {
    print(key);
    var data = await search(key);
    setState(() {
      //根新数据的时候，刷新UI
      _searchModel = data;
    });
  }

  Widget _getAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: TextField(
            autofocus: true,
            onChanged: (String value) {
              _handleSearch(value);
            },
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: HOME_PAGE_SEARCH_HINT,
              icon: SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(SEARCH_ICON),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
        ),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              CANCEL_NAME,
              style: itemTitleStyle,
            ))
      ],
    );
  }

  Widget _getBody() {
    return _searchModel == null ? _getEmptyWidget() : _getListWidget();
  }

  //构建每一行
  Widget _buildRow(SearchItem item) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            item.value,
            style: itemSubTitleStyle,
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _getListWidget() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: _searchModel.data.length,
      itemBuilder: (context, index) {
        return _buildRow(_searchModel.data[index]);
      },
    );
  }

  Widget _getEmptyWidget() {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Padding(
        padding: EdgeInsets.only(top: 45),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.search),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              SizedBox(
                height: 50,
                child: Center(
                  child: Text('您可以输入宝贝代码，简称或者拼音字母开始查找'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _getThemeData(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: _getAppbar(),
        ),
        body: _getBody(),
      ),
    );
  }
}
