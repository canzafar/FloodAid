import 'dart:convert';
import 'package:floodaid/users/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:floodaid/data.dart';
class RememberUserPrefs
{
  //remember/save user info
  static Future<void> storeUserInfo(User userInfo) async{

    SharedPreferences preferences  =  await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());
    await preferences.setString("currentUser", userJsonData);

  }

  static Future<User?> readUserInfo() async{
    User? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userInfo = preferences.getString("currentUser");
    if(userInfo != null)
      {
        Map<String, dynamic> userDataMap = jsonDecode(userInfo);
        currentUserInfo = User.fromJson(userDataMap);
      }
    // Gusername=currentUserInfo!.name;
    // Gemail=currentUserInfo!.email;
    return currentUserInfo;
  }

  static Future<void> removeUserInfo() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentUser");
  }

}