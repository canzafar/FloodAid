import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:floodaid/api_connection/api_connection.dart';
import 'package:fluttertoast/fluttertoast.dart';

String Gusername = '',
    Gemail = '',
    Gpassword = '',
    GorganizationName = '',
    GorganizationPassword = '',
    GorganizationEmail = '';
int GuserId = 0, GorganizationId = 0;
int GselectedOrganization = 0;
List<Task> tasklist = [];

class Task {
  String task, region, date;
  int org_id, task_id;
  Task(
      {required this.date,
      required this.org_id,
      required this.region,
      required this.task,
      required this.task_id});
}

class OrganizationListData {
  String name, email, password;
  int id;
  OrganizationListData(this.id, this.name, this.email, this.password);
}

List<OrganizationListData> organizationList = [];

Future<void> retriveOrganization() async {
  //print('fffffffffffffffffffffffffff');
  try {
    var res = await http.post(Uri.parse(API.retrieveAllOrganization));
    if (res.statusCode == 200) {
      var responseBody = jsonDecode(res.body);
      if (responseBody['success']) {
        for (int i = 0; i < responseBody['organisationData'].length; i++) {
          OrganizationListData temp = OrganizationListData(
              int.parse(responseBody['organisationData'][i]['organisation_id']),
              responseBody['organisationData'][i]['organisation_name'],
              responseBody['organisationData'][i]['organisation_email'],
              responseBody['organisationData'][i]['organisation_password']);
          organizationList.add(temp);
        }
      } else {
        Fluttertoast.showToast(msg: "Connection Error.\nPlease try again");
      }
    }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}

List<String> getOrganizationOption() {
  List<String> opt = [];
  for (int i = 0; i < organizationList.length; i++) {
    opt.add(organizationList[i].name);
    print(organizationList[i].id);
  }
  return opt;
}

Future<void> retriveTasks() async {
  try {
    var res = await http.post(Uri.parse(API.retriveTasks));
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      if (resBody['success']) {
        for (int i = 0; i < resBody['Tasks'].length; i++) {
          tasklist.add(Task(
              date: resBody['Tasks'][i]['date'],
              org_id: int.parse(resBody['Tasks'][i]['organisation_id']),
              region: resBody['Tasks'][i]['region'],
              task: resBody['Tasks'][i]['task'],
              task_id: int.parse(resBody['Tasks'][i]['task_id'])));
        }
      }
      else{
        Fluttertoast.showToast(msg: "Connection Error.\nPlease try again");
      }
    }

  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
}
List<String> getTaskOption() {
  List<String> opt = [];
  for (int i = 0; i < tasklist.length; i++) {
    opt.add(tasklist[i].task);
    print(tasklist[i].task_id);
  }
  return opt;
}