import 'dart:convert';
import 'package:floodaid/users/model/volunteer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberVolunteerPrefs {
  //remember/save volunteer info
  static Future<void> storeVolunteerInfo(Volunteer volunteerInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String volunteerJsonData = jsonEncode(volunteerInfo.toJson());
    await preferences.setString("currentVolunteer", volunteerJsonData);
  }

  static Future<Volunteer?> readVolunteerInfo() async{
    Volunteer? currentVolunteerInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? volunteerInfo = preferences.getString("currentVolunteer");
    if(volunteerInfo != null)
    {
      Map<String, dynamic> volunteerDataMap = jsonDecode(volunteerInfo);
      currentVolunteerInfo = Volunteer.fromJson(volunteerDataMap);
    }
    return currentVolunteerInfo;
  }

  static Future<void> removeVolunteerInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentVolunteer");
  }
}
