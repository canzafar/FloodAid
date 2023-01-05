import 'dart:convert';
import 'thank_you.dart';
import 'package:get/get.dart';
import 'package:floodaid/components/checkbox_group.dart';
import 'package:floodaid/components/themes.dart';
import 'package:floodaid/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:floodaid/api_connection/api_connection.dart';
import '../../data.dart';

class HealthScreen extends StatefulWidget {
  static String id = 'health_screen';
  const HealthScreen({Key? key}) : super(key: key);

  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  List<String>? checkboxGroupValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  storeHealth()async{
    int med=0,vac=0,fod=0,infc=0;
    for(int i=0;i< checkboxGroupValues!.length;i++){
      if(checkboxGroupValues![i]=='Medicines')
        med=1;
      else if(checkboxGroupValues![i]=='Vaccines')
        vac=1;
      else if(checkboxGroupValues![i]=='Fodder')
        fod=1;
      else if(checkboxGroupValues![i]=='Infant Care')
        infc=1;
    }
    try{
      var res=await http.post(Uri.parse(API.sendHealth),
          body:{
            'userID':GuserId.toString(),
            'organizationID':GselectedOrganization.toString(),
            'medicines':med.toString(),
            'vaccines':vac.toString(),
            'fodder':fod.toString(),
            'infant_care':infc.toString(),
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
            'Health',
            style: FlutterFlowTheme.of(context).title1.override(
              fontFamily: 'Poppins',
              color: FlutterFlowTheme.of(context).primaryBtnText,
            ),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
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
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: Image.asset(
                              'images/med.PNG',
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
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: 350,
                        height: 450,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.8, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 0, 0),
                                child: Text(
                                  'Choose Items:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 20),
                              child: FlutterFlowCheckboxGroup(
                                options: [
                                  'Medicines',
                                  'Vaccines',
                                  'Fodder',
                                  'Infant Care'
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
                                    20, 10, 20, 0),
                                //initialized: checkboxGroupValues != null,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                              child: FFButtonWidget(
                                onPressed: () async{
                                  print('Button pressed ...');
                                  await storeHealth();
                                },
                                text: 'Donate Now',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40,
                                  color: Color(0xFF1B75BB),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 8.0,
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
