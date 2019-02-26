import 'package:flutter/material.dart';
import '../theme/options.dart';
import '../theme/constants.dart';
import '../request/api.dart';
import '../manager/user_manager.dart';
import '../commponents/progress_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool _loading = false;

  ThemeData _getThemeData() {
    return initOptions.theme.data.copyWith(
        platform: initOptions.platform,
        primaryColor: Colors.white,
        brightness: Brightness.dark);
  }

  //登陆
  Future<void> _login() async {
    setState(() {
      _loading = !_loading;
    });
    var userName = _emailController.text;
    var password = _pwdController.text;

    var user = await login(userName, password);
    //要保存用户信息到一个单例类中，还要通知用到用户信息的页面去更新
    UserManager.instance.setUser(user);
    Navigator.pop(context, user);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _getThemeData(),
      child: ProgressDialog(
        loading: _loading,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: SizedBox(
                    height: 90,
                    width: 90,
                    child: Image.asset(
                      LOGIN_ICON,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: TextField(
                    controller: _emailController,
                    maxLines: 1,
                    autofocus: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      filled: true,
                      border: UnderlineInputBorder(),
                      labelText: LOGIN_INPUTE_ACCOUNT,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextField(
                    controller: _pwdController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      filled: true,
                      border: UnderlineInputBorder(),
                      labelText: LOGIN_INPUTE_PWD,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: GestureDetector(
                      child: Container(
                        height: 40,
                        color: Color(0xFFFED952),
                        child: Center(
                          child: Text(LOGIN_LOGIN),
                        ),
                      ),
                      onTapDown: (TapDownDetails details) {
                        _login();
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
