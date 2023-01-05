import 'package:floodaid/components/widgets.dart';
import 'package:floodaid/screens/donor/donor.dart';
import 'package:flutter/material.dart';

class Thankyou extends StatefulWidget {
  static String id = 'thank_you';
  const Thankyou({Key? key}) : super(key: key);

  @override
  _ThankyouState createState() => _ThankyouState();
}

class _ThankyouState extends State<Thankyou> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
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
                          image: Image.asset(
                            'images/allbackground.jpg',
                          ).image,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
                              child: Image.asset(
                                'images/thankyou.png',
                                width: double.infinity,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Text(
                              '"Your single step improves the situation of the flood victims by leaps and bounds"',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Roboto Slab',
                                color: Colors.white,
                                fontSize: 30,
                                height: 1.1,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                                Navigator.pushNamed(context, Donor.id);
                              },
                              text: 'Continue',
                              options: FFButtonOptions(
                                width: 130,
                                height: 50,
                                color: Color(0xFF1B75BB),
                                textStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 30.0,
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
      ),
    );
  }
}
