import 'package:flutter/material.dart';
import 'home/main_page.dart';
import 'home/message_page.dart';
import 'home/mine_page.dart';
import '../theme/constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

//创建首页选项卡
class HomePageState extends State<HomePage> {
  static final _tabs = [
    HomeTabModel._(HOME_PAGE, HOME_ICON, HOME_SELECTED_ICON),
    HomeTabModel._(MESSAGE_TITLE, MESSAGE_ICON, MESSAGE_SELECTED_ICON),
    HomeTabModel._(MINE_PAGE, MINE_ICON, MINE_SELECTED_ICON)
  ];
  final _pages = [MainPage(), MessagePage(), MinePage()];
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: _tabs.map<BottomNavigationBarItem>((tab) {
          return BottomNavigationBarItem(
              icon: SizedBox(
                width: 28,
                height: 28,
                child: Image.asset(tab.tabNormalIcon),
              ),
              title: Text(tab.tabName));
        }).toList(),
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}

class HomeTabModel {
  HomeTabModel._(this.tabName, this.tabNormalIcon, this.tabPressedIcon);

  final String tabName;
  final tabNormalIcon;
  final tabPressedIcon;
}
