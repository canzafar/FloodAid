import 'package:floodaid/components/widgets.dart';
import 'package:floodaid/users/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:floodaid/api_connection/api_connection.dart';
import 'package:floodaid/users/model/user.dart';
import 'package:floodaid/users/model/organisation.dart';
import 'package:floodaid/users/model/volunteer.dart';
import 'package:floodaid/data.dart';
// import 'package:floodaid/users/userPreferences/current_user.dart';
// import 'package:floodaid/users/userPreferences/current_organisation.dart';
// import 'package:floodaid/users/userPreferences/current_volunteer.dart';

class EditProfile extends StatefulWidget {
  static String id = 'edit_profile';
  String name;
  // final Function updateRec;
  String email;
  EditProfile(this.name, this.email);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    emailController.text = widget.email;
  }

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   emailController.dispose();
  //   super.dispose();
  // }

  Future<void> updateRecord() async {
    //Donor
    if(LoginScreen.n == 1){
    User userModel = User(
        1,
        nameController.text.trim().toString(),
        emailController.text.trim().toString(),
        ""
    );

    try {
      var res = await http.post(
        Uri.parse(API.updateProfile),
        body: userModel.toJson(),
      );
      if (res.statusCode == 200) {
        var resBodyOfUpdateProfile = jsonDecode(res.body);
        if (resBodyOfUpdateProfile["success"] == true) {
          Fluttertoast.showToast(msg: "Changes Saved Successfully.");
          reflectUpdate();

          // setState(() {
          //   nameController.clear();
          //   emailController.clear();
          // });

        } else {
          Fluttertoast.showToast(msg: "Error. Please try again.");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

    //Organisation
    if(LoginScreen.n == 2){
      Organisation organisationModel = Organisation(
          1,
          nameController.text.trim().toString(),
          emailController.text.trim().toString(),
          ""
      );

      try {
        var res = await http.post(
          Uri.parse(API.updateProfileO),
          body: organisationModel.toJson(),
        );
        if (res.statusCode == 200) {
          var resBodyOfUpdateProfile = jsonDecode(res.body);
          if (resBodyOfUpdateProfile["success"] == true) {
            Fluttertoast.showToast(msg: "Changes Saved Successfully.");
            reflectUpdate();

            // setState(() {
            //   nameController.clear();
            //   emailController.clear();
            // });

          } else {
            Fluttertoast.showToast(msg: "Error. Please try again.");
          }
        }
      } catch (e) {
        print(e.toString());
        Fluttertoast.showToast(msg: e.toString());
      }
    }


    //Volunteer
    if(LoginScreen.n == 3){
      Volunteer volunteerModel = Volunteer(
          1,
          nameController.text.trim().toString(),
          emailController.text.trim().toString(),
          ""
      );

      try {
        var res = await http.post(
          Uri.parse(API.updateProfileV),
          body: volunteerModel.toJson(),
        );
        if (res.statusCode == 200) {
          var resBodyOfUpdateProfile = jsonDecode(res.body);
          if (resBodyOfUpdateProfile["success"] == true) {
            Fluttertoast.showToast(msg: "Changes Saved Successfully.");
            reflectUpdate();
            // updateRecord();
            // setState(() {
            //   nameController.clear();
            //   emailController.clear();
            // });

          } else {
            Fluttertoast.showToast(msg: "Error. Please try again.");
          }
        }
      } catch (e) {
        print(e.toString());
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

void reflectUpdate(){
    setState(() {
      Gusername = nameController.text.trim().toString();
      Gemail = emailController.text.trim().toString();
    });
}

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF1B75BB),
        automaticallyImplyLeading: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                            child: Text(
                              'Update Account Information',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                color: Color(0xFF57575F),
                              ),
                            ),
                          ),
                        ),
                        Form(
                          key: formKey,
                          //autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 0),
                                child: TextFormField(
                                  controller: nameController,
                                  // validator: (val) =>
                                  // val == "" ? "Please enter name" : null,
                                  // autofocus: true,
                                  // obscureText: false,
                                  decoration: const InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF57636C),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF1B75BB),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF1B75BB),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF1B75BB),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFE0E3E7),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color:  Color(0xFF57636C),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF101213),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 0),
                                child: TextFormField(
                                  controller: emailController,
                                  // validator: (val) =>
                                  // val == "" ? "Please enter email" : null,
                                  // autofocus: true,
                                  // obscureText: false,
                                  decoration: const InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF57636C),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF1B75BB),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF1B75BB),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF1B75BB),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFE0E3E7),
                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color:  Color(0xFF57636C),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF101213),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
                                child: FFButtonWidget(
                                  onPressed: ()async {
                                    //print('Button pressed ...');
                                    updateRecord();
                                    reflectUpdate();
        Navigator.pop(context, {Gusername, Gemail});
                                  },
                                  text: 'Save Changes',
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
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
