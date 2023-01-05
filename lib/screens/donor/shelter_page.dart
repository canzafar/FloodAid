import 'package:floodaid/components/checkbox_group.dart';
import 'package:floodaid/components/themes.dart';
import 'package:floodaid/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:floodaid/api_connection/api_connection.dart';
import '../../data.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'thank_you.dart';

class ShelterScreen extends StatefulWidget {
  static String id = 'shelter_screen';
  const ShelterScreen({Key? key}) : super(key: key);

  @override
  _ShelterScreenState createState() => _ShelterScreenState();
}

class _ShelterScreenState extends State<ShelterScreen> {
  List<String>? checkboxGroupValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  storeShelter()async{
    int tents=0,tarp=0,sleepbags=0,mosNets=0,lights=0;
    for(int i=0;i< checkboxGroupValues!.length;i++){
      if(checkboxGroupValues![i]=='Tents')
        tents=1;
      else if(checkboxGroupValues![i]=='Tarpauline Sheets')
        tarp=1;
      else if(checkboxGroupValues![i]=='Sleeping Bags')
        sleepbags=1;
      else if(checkboxGroupValues![i]=='Mosquito Nets')
        mosNets=1;
      else if(checkboxGroupValues![i]=='Solar Lights')
        lights=1;
    }
    try{
      var res=await http.post(Uri.parse(API.sendShelter),
          body:{
            'userID':GuserId.toString(),
            'organizationID':GselectedOrganization.toString(),
            'tents':tents.toString(),
            'tarpaulin_sheets':tarp.toString(),
            'sleeping_bags':sleepbags.toString(),
            'mosquito_nets':mosNets.toString(),
            'solar_lights':lights.toString(),
          });//kitna bekar h android studio
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
            'Shelter Items',
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
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'images/shelterDonation.jpg',
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
                                  'Choose Shelter Items:',
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
                                  20, 10, 20, 0),
                              child: FlutterFlowCheckboxGroup(
                                options: [
                                  'Tents',
                                  'Tarpauline Sheets',
                                  'Sleeping Bags',
                                  'Mosquito Nets',
                                  'Solar Lights'
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
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                              child: FFButtonWidget(
                                onPressed: () async{
                                  print('Button pressed ...');
                                  await storeShelter();
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
