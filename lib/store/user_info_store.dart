import 'package:flutter/cupertino.dart';
import '../model/user_info_model.dart';

class UserInfoStore extends ChangeNotifier {

  UserInfoModel _userInfoModel;

  UserInfoStore(this._userInfoModel);

  UserInfoModel get userInfoModel => _userInfoModel;

  set userInfoModel(UserInfoModel value) {
    _userInfoModel = value;
    notifyListeners();
  }

}