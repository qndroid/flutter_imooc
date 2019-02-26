import '../model/user_model.dart';

class UserManager {
  // 工厂模式
  factory UserManager() => _getInstance();

  static UserManager get instance => _getInstance();
  static UserManager _instance;

  //要保存的信息
  User _user;

  UserManager._internal();

  static UserManager _getInstance() {
    if (_instance == null) {
      _instance = new UserManager._internal();
    }
    return _instance;
  }

  void setUser(User user) {
    this._user = user;
  }

  User get user => this._user;
}
