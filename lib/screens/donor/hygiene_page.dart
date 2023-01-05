import 'dart:convert';
import 'package:floodaid/components/checkbox_group.dart';
import 'package:floodaid/components/themes.dart';
import 'package:floodaid/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:floodaid/api_connection/api_connection.dart';
import '../../data.dart';
import 'thank_you.dart';
import 'package:get/get.dart';

class HygieneScreen extends StatefulWidget {
  static String id = 'hygiene_screen';
  const HygieneScreen({Key? key}) : super(key: key);

  @override
  _HygieneScreenState createState() => _HygieneScreenState();
}

class _HygieneScreenState extends State<HygieneScreen> {
  List<String>? checkboxGroupValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  storeHygiene()async{
    int soap=0,shampoo=0,tooth=0,det=0,mosq=0;
    for(int i=0;i< checkboxGroupValues!.length;i++){
      if(checkboxGroupValues![i]=='Soap')
        soap=1;
      else if(checkboxGroupValues![i]=='Shampoo')
        shampoo=1;
      else if(checkboxGroupValues![i]=='Toothpaste / Toothbrush')
        tooth=1;
      else if(checkboxGroupValues![i]=='Detergents / Surf')
        det=1;
      else if(checkboxGroupValues![i]=='Mosquito Repellent')
        mosq=1;
    }
    try{
      var res=await http.post(Uri.parse(API.sendHygiene),
          body:{//sunlen sb kch int hai table m.
            'userID':GuserId.toString(),
            'organizationID':GselectedOrganization.toString(),
            'soap':soap.toString(),
            'shampoo':shampoo.toString(),
            'detergents':det.toString(),
            'toothBrushesPastes':tooth.toString(),
            'mosquito_repellent':mosq.toString(),
          });
      if(res.statusCode==200){
        var resBody=jsonDecode(res.body);
        if(resBody['success']){
          Fluttertoast.showToast(msg: "Record Submitted");
          Future.delayed(
            Duration(milliseconds: 900),
                () {
              Get.to(Thankyou());
            },
          );

        }
      }
      else{
        Fluttertoast.showToast(msg: "Connection Error\nPlease try again");
      }

    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF1B75BB),
        automaticallyImplyLeading: true,
        title: Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Text(
            'Hygiene Items',
            style: FlutterFlowTheme.of(context).title1.override(
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 5,
      ),
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
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'images/hygiene.PNG',
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
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: 350,
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.6, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 0, 0),
                                child: Text(
                                  'Choose Hygiene Items:',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 20, 0),
                                child: FlutterFlowCheckboxGroup(
                                  options: [
                                    'Soap',
                                    'Toothpaste / Toothbrush',
                                    'Shampoo',
                                    'Detergents / Surf',
                                    'Mosquito Repellent',
                                  ],
                                  onChanged: (val) =>
                                      setState(() => checkboxGroupValues = val),
                                  activeColor: Color(0xFF1B75BB),
                                  checkColor: Colors.white,
                                  checkboxBorderColor: Color(0xFF95A1AC),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                  itemPadding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  //initialized: checkboxGroupValues != null,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.05, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 20, 10),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    print('Button pressed ...');
                                    await storeHygiene();
                                  },
                                  text: 'Donate',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40,
                                    color: Color(0xFF1B75BB),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
