import 'dart:convert';
import 'package:floodaid/users/model/organisation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberOrganisationPrefs
{
  //remember/save user info
  static Future<void> storeOrganisationInfo(Organisation organisationInfo) async{

    SharedPreferences preferences  =  await SharedPreferences.getInstance();
    String organisationJsonData = jsonEncode(organisationInfo.toJson());
    await preferences.setString("currentOrganisation", organisationJsonData);

  }

  static Future<Organisation?> readOrganisationInfo() async{
    Organisation? currentOrganisationInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? organisationInfo = preferences.getString("currentOrganisation");
    if(organisationInfo != null)
    {
      Map<String, dynamic> organisationDataMap = jsonDecode(organisationInfo);
      currentOrganisationInfo = Organisation.fromJson(organisationDataMap);
    }
    return currentOrganisationInfo;
  }

  static Future<void> removeOrganisationInfo() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentOrganisation");
  }

}