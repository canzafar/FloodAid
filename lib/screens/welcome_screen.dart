import 'package:floodaid/users/authentication/login_screen.dart';
import 'package:floodaid/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:floodaid/users/authentication/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, cons) {
            return SingleChildScrollView(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 800,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        opacity: 100.0,
                        image: Image.asset(
                          'images/allbackground.jpg',
                        ).image,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Image.asset('images/logo.png'),
                                height: 90.0,
                              ),
                              Text(
                                'FloodAid',
                                style: TextStyle(
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff1b75bb),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 48.0,
                          ),
                          RoundedButton(
                              textChild: 'Log In',
                              colour: Color(0xff5cbddf),
                              onpress: () {
                                Navigator.pushNamed(context, LoginScreen.id);
                              }),
                          RoundedButton(textChild: 'Register',
                              colour: Color(0xff1b75bb),
                              onpress: () {
                                Navigator.pushNamed(context, RegistrationScreen.id);
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
        },
      ),
    );
  }
}