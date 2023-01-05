import 'package:fluttertoast/fluttertoast.dart';
//import 'package:get/get.dart';
import '../../users/authentication/login_screen.dart';
import '../../users/model/user.dart';
import 'Package:floodaid/components/themes.dart';
import 'Package:floodaid/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:floodaid/api_connection/api_connection.dart';
import 'package:floodaid/users/model/organisation.dart';
import 'package:floodaid/users/model/volunteer.dart';


class ChangePassword extends StatefulWidget {
  static String id = 'change_password';
  final String email;
  final String password;
  const ChangePassword(this.email, this.password);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController.text = widget.email;
    passwordController.text = widget.password;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> updatePassword() async {
    //Donor
    if(LoginScreen.n == 1){
      User userModel = User(
          1,
          "",
          emailController.text.trim().toString(),
          passwordController.text.trim().toString(),
      );

      try {
        var res = await http.post(
          Uri.parse(API.changePassword),
          body: userModel.toJson(),
        );
        if (res.statusCode == 200) {
          var resBodyOfChangePass = jsonDecode(res.body);
          if (resBodyOfChangePass["success"] == true) {
            Fluttertoast.showToast(msg: "Changes Saved Successfully.");

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
          "",
          emailController.text.trim().toString(),
          passwordController.text.trim().toString()
      );

      try {
        var res = await http.post(
          Uri.parse(API.changePasswordO),
          body: organisationModel.toJson(),
        );
        if (res.statusCode == 200) {
          var resBodyOfChangePass = jsonDecode(res.body);
          if (resBodyOfChangePass["success"] == true) {
            Fluttertoast.showToast(msg: "Changes Saved Successfully.");

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
          "",
          emailController.text.trim().toString(),
          passwordController.text.trim().toString(),
      );

      try {
        var res = await http.post(
          Uri.parse(API.changePasswordV),
          body: volunteerModel.toJson(),
        );
        if (res.statusCode == 200) {
          var resBodyOfChangePass = jsonDecode(res.body);
          if (resBodyOfChangePass["success"] == true) {
            Fluttertoast.showToast(msg: "Password Changed Successfully.");

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B75BB),
        automaticallyImplyLeading: true,
        title: const Text(
          'Change Password',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Align(
                          alignment: AlignmentDirectional(-0.95, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(20, 10, 10, 0),
                            child: Text(
                              'Enter your new password only',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF57575F),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                          child: TextFormField(
                            controller: passwordController,
                            autofocus: true,
                            obscureText: false,
                            decoration: const InputDecoration(
                              hintText: 'Enter new Password',
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
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
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
                                Icons.key,
                                 color: Color(0xFF57636C),
                              ),
                            ),
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                              color: Color(0xFF101213),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                          child: TextFormField(
                            controller: emailController,
                            autofocus: true,
                            obscureText: false,
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
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
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
                                color: Color(0xFF57636C),
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
                          const EdgeInsetsDirectional.fromSTEB(30, 40, 30, 0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                              updatePassword();
                            },
                            text: 'Save Password',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40,
                              color: const Color(0xFF1B75BB),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              borderSide: const BorderSide(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
