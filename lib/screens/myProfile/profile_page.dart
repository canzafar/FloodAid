import 'package:floodaid/components/themes.dart';
import 'package:floodaid/components/widgets.dart';
import 'package:floodaid/users/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:floodaid/screens/myProfile/edit_profile.dart';
import 'package:floodaid/screens/myProfile/change_password.dart';
import 'package:get/get.dart';
import 'package:floodaid/users/userPreferences/user_preferences.dart';
import '../../users/model/organisation.dart';
import '../../users/model/user.dart';
import '../../users/model/volunteer.dart';
import '../../users/userPreferences/organisation_preferences.dart';
import '../../users/userPreferences/volunteer_preferences.dart';
import 'package:floodaid/users/userPreferences/current_user.dart';
import 'package:floodaid/users/userPreferences/current_organisation.dart';
import 'package:floodaid/users/userPreferences/current_volunteer.dart';
import '../menu.dart';
import 'package:floodaid/api_connection/api_connection.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:floodaid/data.dart';
import 'package:floodaid/screens/aboutUs.dart';
//import 'package:floodaid/users/model/user.dart';
// import 'package:floodaid/users/model/organisation.dart';
// import 'package:floodaid/users/model/volunteer.dart';

class MyProfile extends StatefulWidget {
  static String id = 'my_profile';

  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Organisation organisation = Organisation(1, '', '', '');

  User user = User(1, '', '', '');

  Volunteer volunteer = Volunteer(1, '', '', '');

  static String xname = '';
  static String xemail = '';
  static String xpass = '';

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initPlatformState() async {
    print("------00-0-0-0----------------------------------");
    if (LoginScreen.n == 1) {
      User usertemp = await CurrentUser.getUserInfo();
      setState(() {
        user = usertemp;
        xname = user.name;
        xemail = user.email;
        xpass = user.user_password;
      });
    }

    if (LoginScreen.n == 2) {
      Organisation organisationtemp =
          await CurrentOrganisation.getOrganisationInfo();
      setState(() {
        organisation = organisationtemp;
        xname = organisation.organisation_name;
        xemail = organisation.organisation_email;
        xpass = organisation.organisation_password;
      });
    }

    if (LoginScreen.n == 3) {
      Volunteer volunteertemp = await CurrentVolunteer.getVolunteerInfo();
      setState(() {
        volunteer = volunteertemp;
        xname = volunteer.volunteer_name;
        xemail = volunteer.volunteer_email;
        xpass = volunteer.volunteer_password;
      });
    }
  }

  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFE0E3E7)),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 20,
            color: Colors.black,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            userData,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  signOutUser() async {
    var resultResponse = await Get.dialog(
      AlertDialog(
          backgroundColor: Color(0xFFE0E3E7),
          title: const Text(
            "Log Out",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: const Text(
            "Are you sure\nyou want to Log out?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "No",
                  style: TextStyle(color: Colors.black),
                )),
            TextButton(
                onPressed: () {
                  Get.back(result: "loggedOut");
                },
                child: const Text(
                  "Yes",
                  style: TextStyle(color: Colors.black),
                )),
          ]),
    );

    //Donor
    if (LoginScreen.n == 1) {
      if (resultResponse == "loggedOut") {
        //Delete/remove the user data from phone local storage
        RememberUserPrefs.removeUserInfo().then((value) {
          Get.off(const MenuScreen());
        });
      }
    }

    //Organisation
    if (LoginScreen.n == 2) {
      if (resultResponse == "loggedOut") {
        //Delete/remove the user data from phone local storage
        RememberOrganisationPrefs.removeOrganisationInfo().then((value) {
          Get.off(const MenuScreen());
        });
      }
    }

    //Volunteer
    if (LoginScreen.n == 3) {
      if (resultResponse == "loggedOut") {
        //Delete/remove the user data from phone local storage
        RememberVolunteerPrefs.removeVolunteerInfo().then((value) {
          Get.off(const MenuScreen());
        });
      }
    }
  }

  Future<void> deleteUser() async {
    var resultResponse = await Get.dialog(
      AlertDialog(
          backgroundColor: Color(0xFFE0E3E7),
          title: const Text(
            "Delete Account",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: const Text(
            "Are you sure you want to delete your account?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "No",
                  style: TextStyle(color: Colors.black),
                )),
            TextButton(
                onPressed: () async {
                  //Get.back(result: "deleted");
                  //implement here!!!!!!!
                  if (LoginScreen.n == 1) {
                    User userModel = User(1, "", xemail.trim().toString(), "");
                    try {
                      var res = await http.post(
                        Uri.parse(API.deleteUser),
                        body: userModel.toJson(),
                      );
                      if (res.statusCode == 200) {
                        var resBodyOfDeleteUser = jsonDecode(res.body);
                        if (resBodyOfDeleteUser["success"] == true) {
                          Fluttertoast.showToast(
                              msg: "Account deleted Successfully.");
                          Future.delayed(
                            Duration(milliseconds: 1000),
                            () {
                              //hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
                              Get.to(MenuScreen());
                            },
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Error. Please try again.");
                        }
                      }
                    } catch (e) {
                      print(e.toString());
                      Fluttertoast.showToast(msg: e.toString());
                    }
                  }
                  if (LoginScreen.n == 2) {
                    Organisation organisationModel =
                        Organisation(1, "", xemail.trim().toString(), "");
                    try {
                      var res = await http.post(
                        Uri.parse(API.deleteUserO),
                        body: organisationModel.toJson(),
                      );
                      if (res.statusCode == 200) {
                        var resBodyOfDeleteUser = jsonDecode(res.body);
                        if (resBodyOfDeleteUser["success"] == true) {
                          Fluttertoast.showToast(
                              msg: "Account deleted Successfully.");
                          Future.delayed(
                            const Duration(milliseconds: 1000),
                            () {
                              Get.to(MenuScreen());
                            },
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Error. Please try again.");
                        }
                      }
                    } catch (e) {
                      print(e.toString());
                      Fluttertoast.showToast(msg: e.toString());
                    }
                  }
                  if (LoginScreen.n == 3) {
                    Volunteer volunteerModel =
                        Volunteer(1, "", xemail.trim().toString(), "");
                    try {
                      var res = await http.post(
                        Uri.parse(API.deleteUserV),
                        body: volunteerModel.toJson(),
                      );
                      if (res.statusCode == 200) {
                        var resBodyOfDeleteUser = jsonDecode(res.body);
                        if (resBodyOfDeleteUser["success"] == true) {
                          Fluttertoast.showToast(
                              msg: "Account deleted Successfully.");
                          Future.delayed(
                            const Duration(milliseconds: 1000),
                            () {
                              Get.to(const MenuScreen());
                            },
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Error. Please try again.");
                        }
                      }
                    } catch (e) {
                      print(e.toString());
                      Fluttertoast.showToast(msg: e.toString());
                    }
                  }
                },
                child: const Text(
                  "Yes",
                  style: TextStyle(color: Colors.black),
                )),
          ]),
    );

    //Donor
    if (LoginScreen.n == 1) {
      if (resultResponse == "deleted") {
        //Delete/remove the user data from phone local storage
        RememberUserPrefs.removeUserInfo().then((value) {
          Get.off(const MenuScreen());
        });
      }
    }

    //Organisation
    if (LoginScreen.n == 2) {
      if (resultResponse == "deleted") {
        //Delete/remove the user data from phone local storage
        RememberOrganisationPrefs.removeOrganisationInfo().then((value) {
          Get.off(const MenuScreen());
        });
      }
    }

    //Volunteer
    if (LoginScreen.n == 3) {
      if (resultResponse == "deleted") {
        //Delete/remove the user data from phone local storage
        RememberVolunteerPrefs.removeVolunteerInfo().then((value) {
          Get.off(const MenuScreen());
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B75BB),
        automaticallyImplyLeading: true,
        title: Text(
          'My Profile',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Image.asset(
                      "images/person.png",
                      width: 150,
                    ),
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 10, 0, 0),
                    child: Text(
                      'Account Information',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: Color(0xFF57575F),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: userInfoItemProfile(Icons.person, xname),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: userInfoItemProfile(Icons.email, xemail),
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 25, 0, 0),
                    child: Text(
                      'Account Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: Color(0xFF57575F),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: InkWell(
                    onTap: () async {
                      //Navigator.pushNamed(context, EditProfile.id);

                     var data= await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(xname, xemail,),
                        ),
                      );
                     setState(() {
                       xname= data.first;
                       xemail = data.last;
                       Gusername=data.first;
                       Gemail=data.last;
                     });

                    },
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Color(0xFF0C0C0C),
                      ),
                      title: const Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: const Color(0xFFE0E3E7),
                      dense: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChangePassword(xemail, Gpassword)));
                    },
                    child: ListTile(
                      leading: const Icon(
                        Icons.vpn_key_rounded,
                        color: Color(0xFF0C0C0C),
                      ),
                      title: const Text(
                        'Change Password',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Color(0xFFE0E3E7),
                      dense: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 30, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      //print('Button pressed ...');
                      deleteUser();
                    },
                    text: 'Delete Account',
                    options: const FFButtonOptions(
                      width: double.infinity,
                      height: 40,
                      color: Color(0xFF5CBDDF),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      //print('Button pressed ...');
                      signOutUser();
                    },
                    text: 'Log Out',
                    options: const FFButtonOptions(
                      width: double.infinity,
                      height: 40,
                      color: Color(0xFF1B75BB),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                  child: Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: TextButton(
                        onPressed: (){Navigator.pushNamed(context, Micard.id);},
                        child: Text(
                          'About Developers',
                          style: TextStyle(
                            color: const Color(0xFF1B75BB),
                            fontSize: 16
                          ),
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
