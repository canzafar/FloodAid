import 'package:floodaid/screens/organisation/organisation_screen.dart';
import 'package:floodaid/screens/volunteer/volunteer_screen.dart';
import 'dart:convert';
import 'package:floodaid/users/authentication/registration_screen.dart';
import 'package:floodaid/users/userPreferences/user_preferences.dart';
import 'package:floodaid/users/userPreferences/organisation_preferences.dart';
import 'package:floodaid/users/userPreferences/volunteer_preferences.dart';
import 'package:flutter/material.dart';
import 'package:floodaid/components/rounded_button.dart';
import 'package:floodaid/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:http/http.dart' as http;
import 'package:floodaid/api_connection/api_connection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:floodaid/users/model/user.dart';
import 'package:floodaid/users/model/organisation.dart';
import 'package:floodaid/users/model/volunteer.dart';
import 'package:floodaid/screens/donor/donor.dart';
import 'package:floodaid/data.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  static int n = 0;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  loginUserNow() async {
    //DONOR LOGIN
    if (LoginScreen.n == 1) {
      //print("hellooooooooooooooooooooooooooooooooooo11111111");
      try {
        var res = await http.post(
          Uri.parse(API.login),
          body: {
            "email": emailController.text.trim().toString(),
            "user_password": passwordController.text.trim().toString(),
          },
        );

        if (res.statusCode == 200) {
          var resBodyOfLogin = jsonDecode(res.body);
          if (resBodyOfLogin['success']) {
            Fluttertoast.showToast(msg: "Login Successfully.");

            User userInfo = User.fromJson(resBodyOfLogin["userData"]);
            GuserId= userInfo.user_id;
            //save user info to local storage using shared references
            await RememberUserPrefs.storeUserInfo(userInfo);

            Future.delayed(
              Duration(milliseconds: 1000),
              () {
                  Get.to(Donor());
              },
            );
          } else {
            Fluttertoast.showToast(msg: "Incorrect password or email.");
          }
        }
      } catch (e) {
        print("Error :: " + e.toString());
      }
    }

    //ORGANISATION LOGIN
    if (LoginScreen.n == 2) {
      //print("hellooooooooooooooooooooooooooooooooooo22222222");
      try {
        var res = await http.post(
          Uri.parse(API.loginO),
          body: {
            "organisation_email": emailController.text.trim().toString(),
            "organisation_password": passwordController.text.trim().toString(),
          },
        );

        if (res.statusCode == 200) {
          var resBodyOfLogin = jsonDecode(res.body);
          if (resBodyOfLogin['success']) {
            Fluttertoast.showToast(msg: "Login Successfully.");

            Organisation organisationInfo = Organisation.fromJson(resBodyOfLogin["organisationData"]);
            GorganizationId=organisationInfo.organisation_id;
            GorganizationEmail=organisationInfo.organisation_email;
            GorganizationName=organisationInfo.organisation_name;
            GorganizationPassword=organisationInfo.organisation_password;

            //save user info to local storage using shared references
            await RememberOrganisationPrefs.storeOrganisationInfo(organisationInfo);

            Future.delayed(
              Duration(milliseconds: 1000),
              () {
                Get.to(OrganisationScreen());
              },
            );
          } else {
            Fluttertoast.showToast(msg: "Incorrect password or email.");
          }
        }
      } catch (e) {
        print("Error :: " + e.toString());
      }
    }

    //VOLUNTEER LOGIN
    if (LoginScreen.n == 3) {
      //print("hellooooooooooooooooooooooooooooooooooo33333333");
      try {
        var res = await http.post(
          Uri.parse(API.loginV),
          body: {
            "volunteer_email": emailController.text.trim().toString(),
            "volunteer_password": passwordController.text.trim().toString(),
          },
        );

        if (res.statusCode == 200) {
          var resBodyOfLogin = jsonDecode(res.body);
          if (resBodyOfLogin['success']) {
            Fluttertoast.showToast(msg: "Login Successfully.");

            Volunteer volunteerInfo = Volunteer.fromJson(resBodyOfLogin["volunteerData"]);
            //save user info to local storage using shared references
            await RememberVolunteerPrefs.storeVolunteerInfo(volunteerInfo);

            Future.delayed(
              Duration(milliseconds: 1000),
              () {
                Get.to(VolunteerScreen());
              },
            );
          } else {
            Fluttertoast.showToast(msg: "Incorrect password or email.");
          }
        }
      } catch (e) {
        print("Error :: " + e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Align(
              alignment: AlignmentDirectional(0, 0),
            child : Container(
              width: double.infinity,
              height: 800,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  opacity: 110.0,
                  image: Image.asset(
                    'images/allbackground.jpg',
                  ).image,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 60.0),
                      Container(
                        height: 150.0,
                        child: Image.asset('images/logo.png'),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              controller: emailController,
                              validator: (val) =>
                                  val == "" ? "Please enter email" : null,
                              decoration: kInputDecorationField.copyWith(
                                hintText: 'Enter your Email',
                                prefixIcon: const Icon(
                                  Icons.email_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Obx(
                              () => TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: passwordController,
                                obscureText: isObsecure.value,
                                validator: (val) =>
                                    val == "" ? "Please enter password" : null,
                                decoration: kInputDecorationField.copyWith(
                                  hintText: 'Enter your password',
                                  prefixIcon: const Icon(
                                    Icons.vpn_key_rounded,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        isObsecure.value = !isObsecure.value;
                                      },
                                      child: Icon(
                                        isObsecure.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            RoundedButton(
                                textChild: 'Log In',
                                colour: Color(0xff5cbddf),
                                onpress: () {
                                  if (formKey.currentState!.validate()) {
                                    loginUserNow();
                                    //Navigator.pushNamed(context, Donor.id);
                                  }
                                  //Navigator.pushNamed(context, MenuScreen.id);
                                }),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an Account?",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegistrationScreen.id);
                            },
                            child: const Text(
                              'Register here',
                              style: TextStyle(
                                  fontSize: 15.5, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
