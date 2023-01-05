import 'package:floodaid/users/authentication/login_screen.dart';
import 'package:floodaid/users/authentication/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:floodaid/components/rounded_button.dart';
import 'package:floodaid/screens/welcome_screen.dart';
//import 'package:floodaid/screens/donor/donate_screen.dart';
// import 'package:floodaid/screens/organisation_screen.dart';
// import 'package:floodaid/screens/volunteer_screen.dart';

class MenuScreen extends StatefulWidget {
  static String id =  'menu_screen';
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
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
                        padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(height: 80.0),
                            Container(
                              height: 150.0,
                              child: Image.asset('images/logo.png'),
                            ),
                            SizedBox(height: 5.0),
                            const Center(
                              child: Text(
                                'FloodAid',
                                style: TextStyle(
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff1b75bb),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            const Center(
                              child: Text('Choose an option',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                              width: 5.0,
                              child: Divider(
                                color: Colors.white,
                                thickness: 2.0,
                                indent: 100.0,
                                endIndent: 100.0,
                              ),
                            ),
                            RoundedButton(
                                textChild: 'Organisation',
                                colour: Color(0xff1b75bb),
                                onpress: (){
                                  LoginScreen.n = 2;
                                  RegistrationScreen.n = 2;
                                  Navigator.pushNamed(context, WelcomeScreen.id);
                                }),
                            SizedBox(height: 8.0),
                            RoundedButton(
                                textChild: 'Donor',
                                colour: Color(0xff1b75bb),
                                onpress: (){
                                  LoginScreen.n = 1;
                                  RegistrationScreen.n = 1;
                                  Navigator.pushNamed(context, WelcomeScreen.id);
                                }),
                            SizedBox(height: 8.0),
                           RoundedButton(
                               textChild: 'Volunteer',
                               colour: Color(0xff1b75bb),
                               onpress: (){
                                 LoginScreen.n = 3;
                                 RegistrationScreen.n = 3;
                                 Navigator.pushNamed(context, WelcomeScreen.id);
                               }),
                          ],
                        ),
                      ),
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
