import 'dart:convert';

import 'package:floodaid/components/drop_down.dart';
import 'package:floodaid/components/themes.dart';
//import 'package:floodaid/components/util.dart';
import 'package:floodaid/components/widgets.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:floodaid/data.dart';
import 'package:floodaid/api_connection/api_connection.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'thank_you.dart';

class MoneyScreen extends StatefulWidget {
  static String id = 'money_screen';
  const MoneyScreen({Key? key}) : super(key: key);

  @override
  _MoneyScreenState createState() => _MoneyScreenState();
}

class _MoneyScreenState extends State<MoneyScreen> {
  String? dropDownValue;
  double? sliderValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  storeMoney() async {
    try {
      var res = await http.post(Uri.parse(API.sendMoney), body: {
        'userID': (GuserId.toString()),
        'organizationID': GselectedOrganization.toString(),
        'fund': textController.text.trim().toString()
      });
      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.body);
        if (resBody['success']) {
          Fluttertoast.showToast(msg: "Record Submitted");
          Future.delayed(
            Duration(milliseconds: 900),
                () {
              Get.to(Thankyou());
            },
          );
        }
      } else {
        Fluttertoast.showToast(msg: "Connection Error\nPlease try again");
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: Color(0xFF1B75BB),
              automaticallyImplyLeading: true,
              title: Text(
                'Donate Money',
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 4,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 350,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'images/moneyDonation.jpg',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: 350,
                              height: 400,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 30, 10, 0),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0xFFF5F5F5),
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 10, 20),
                                              child: Text(
                                                'Choose Fund donation option:',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18,
                                                        color: Colors.black),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(-0.7, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 20),
                                                child: FlutterFlowDropDown(
                                                  initialOption:
                                                      dropDownValue ??=
                                                          'General Fund',
                                                  options: [
                                                    'General Fund',
                                                    'Khairat',
                                                    'Zakat'
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () =>
                                                          dropDownValue = val),
                                                  width: 350,
                                                  height: 50,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                      ),
                                                  hintText: 'Please select...',
                                                  fillColor: Colors.white,
                                                  elevation: 2,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0,
                                                  borderRadius: 0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(12, 4, 12, 4),
                                                  hidesUnderline: true,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 20, 10, 0),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0xFFF5F5F5),
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Form(
                                          key: formKey,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -0.85, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                                  child: Text(
                                                    'Enter Amount:',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 10, 20),
                                                child: TextFormField(
                                                  controller: textController,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: 'Eg: 100',
                                                    hintStyle: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xFFFFFFFF),
                                                  ),
                                                  style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    //chla k dkhen m aya
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 20, 10, 10),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          print('Button pressed ...');
                                          await storeMoney();
                                        },
                                        text: 'Donate Now',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50,
                                          color: Color(0xFF3984EF),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                          elevation: 5,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 8.0,
                                        ),
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
            },
          ),
        ),
      ),
    );
  }
}
