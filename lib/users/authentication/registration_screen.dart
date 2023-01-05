import 'dart:convert';
import 'package:floodaid/api_connection/api_connection.dart';
import 'package:floodaid/screens/donor/donate_screen.dart';
import 'package:floodaid/screens/donor/donor.dart';
import 'package:floodaid/screens/organisation/organisation_screen.dart';
import 'package:floodaid/screens/volunteer/volunteer_screen.dart';
import 'package:flutter/material.dart';
import 'package:floodaid/components/rounded_button.dart';
import 'package:floodaid/constants.dart';
import 'package:get/get.dart';
import 'package:floodaid/users/authentication/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:floodaid/users/model/user.dart';
import 'package:floodaid/users/model/organisation.dart';
import 'package:floodaid/users/model/volunteer.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  static int n = 0;
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  validateUserEmail() async {
    //Donor
    if (RegistrationScreen.n == 1){
      try {
        var res = await http.post(
          //communicating with the server
          Uri.parse(API.validateEmail),
          body: {
            'email': emailController.text.trim().toString(),
          },
        );
        if (res.statusCode == 200) //200 == http ok success
            {
          var resBodyOfValidateEmail = jsonDecode(res.body);

          if (resBodyOfValidateEmail["emailFound"] == true) {
            Fluttertoast.showToast(
                msg: "Email is already in someone else use. Try another email.");
          } else {
            registerAndSaveRecord();
          }
        }
      } catch (e) {
        print(e.toString());
        Fluttertoast.showToast(msg: e.toString());
      }
  }



    //Organisation
    if (RegistrationScreen.n == 2){
      try {
        var res = await http.post(
          //communicating with the server
          Uri.parse(API.validateEmailO),
          body: {
            'organisation_email': emailController.text.trim().toString(),
          },
        );
        if (res.statusCode == 200) //200 == http ok success
            {
          var resBodyOfValidateEmail = jsonDecode(res.body);

          if (resBodyOfValidateEmail["emailFound"] == true) {
            Fluttertoast.showToast(
                msg: "Email is already in someone else use. Try another email.");
          } else {
            registerAndSaveRecord();
          }
        }
      } catch (e) {
        print(e.toString());
        Fluttertoast.showToast(msg: e.toString());
      }
    }



    //Volunteer
    if (RegistrationScreen.n == 3){
      try {
        var res = await http.post(
          //communicating with the server
          Uri.parse(API.validateEmailV),
          body: {
            'volunteer_email': emailController.text.trim().toString(),
          },
        );
        if (res.statusCode == 200) //200 == http ok success
            {
          var resBodyOfValidateEmail = jsonDecode(res.body);

          if (resBodyOfValidateEmail["emailFound"] == true) {
            Fluttertoast.showToast(
                msg: "Email is already in someone else use. Try another email.");
          } else {
            registerAndSaveRecord();
          }
        }
      } catch (e) {
        print(e.toString());
        Fluttertoast.showToast(msg: e.toString());
      }
    }

  }


  registerAndSaveRecord() async {
    //Donor
    if(RegistrationScreen.n == 1) {
      User userModel = User(
        1,
        nameController.text.trim().toString(),
        emailController.text.trim().toString(),
        passwordController.text.trim().toString(),
      );

      try {
        var res = await http.post(
          Uri.parse(API.signup),
          body: userModel.toJson(),
        );
        if (res.statusCode == 200) {
          var resBodyOfSignUp = jsonDecode(res.body);
          if (resBodyOfSignUp['success']) {
            Fluttertoast.showToast(msg: "Sign Up Successfully.");

            setState(() {
              nameController.clear();
              emailController.clear();
              passwordController.clear();
            });

            Future.delayed(
              Duration(milliseconds: 2000),
                  () {
                Get.to(Donor());
              },
            );

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
    if(RegistrationScreen.n == 2) {
      Organisation organisationModel = Organisation(
        1,
        nameController.text.trim().toString(),
        emailController.text.trim().toString(),
        passwordController.text.trim().toString(),
      );

      try {
        var res = await http.post(
          Uri.parse(API.signupO),
          body: organisationModel.toJson(),
        );
        if (res.statusCode == 200) {
          var resBodyOfSignUp = jsonDecode(res.body);
          if (resBodyOfSignUp['success']) {
            Fluttertoast.showToast(msg: "Sign Up Successfully.");

            setState(() {
              nameController.clear();
              emailController.clear();
              passwordController.clear();
            });

            Future.delayed(
              Duration(milliseconds: 2000),
                  () {
                Get.to(OrganisationScreen());
              },
            );

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
    if(RegistrationScreen.n == 3) {
      Volunteer volunteerModel = Volunteer(
        1,
        nameController.text.trim().toString(),
        emailController.text.trim().toString(),
        passwordController.text.trim().toString(),
      );

      try {
        var res = await http.post(
          Uri.parse(API.signupV),
          body: volunteerModel.toJson(),
        );
        if (res.statusCode == 200) {
          var resBodyOfSignUp = jsonDecode(res.body);
          if (resBodyOfSignUp['success']) {
            Fluttertoast.showToast(msg: "Sign Up Successfully.");

            setState(() {
              nameController.clear();
              emailController.clear();
              passwordController.clear();
            });

            Future.delayed(
              Duration(milliseconds: 2000),
                  () {
                Get.to(VolunteerScreen());
              },
            );

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 60.0,),
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
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: nameController,
                          validator: (val) =>
                              val == "" ? "Please enter name" : null,
                          decoration: kInputDecorationField.copyWith(
                            hintText: 'Name',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
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
                            textChild: 'Register',
                            colour: Color(0xff1b75bb),
                            onpress: () {
                              if (formKey.currentState!.validate()) {
                                //validate the email -> unique emails
                                validateUserEmail();
                                if(LoginScreen.n == 1)
                                  { Navigator.pushNamed(context, Donate.id);}
                                if(LoginScreen.n == 2)
                                  { Navigator.pushNamed(context, OrganisationScreen.id);}
                                if(LoginScreen.n == 1)
                                  { Navigator.pushNamed(context, VolunteerScreen.id);}
                              }
                            },),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an Account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        child: const Text(
                          'Sign in',
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
    );
  }
}
