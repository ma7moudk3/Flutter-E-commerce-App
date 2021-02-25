import 'dart:convert';

import 'package:ecommerce_app/helper/constants.dart';
import 'package:ecommerce_app/model/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel> get getUserData async {
    try {
      UserModel user = await _getUserData();
      if (user == null) {
        return null;
      }
      return user;
    } catch (e) {
      print('get user error :' + e.toString());
      return null;
    }
  }

  setUser(UserModel user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(USER_DATA_KEY, json.encode(user.toJson()));
  }

  _getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var value = preferences.get(USER_DATA_KEY);
    return UserModel.fromJson(json.decode(value));
  }

  void deleteUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
