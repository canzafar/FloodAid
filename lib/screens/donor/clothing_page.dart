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

class ClothingScreen extends StatefulWidget {
  static String id = 'clothing_screen';
  const ClothingScreen({Key? key}) : super(key: key);

  @override
  _ClothingScreenState createState() => _ClothingScreenState();
}

class _ClothingScreenState extends State<ClothingScreen> {
  List<String>? checkboxGroupValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  storeClothing()async{
    int mcl=0,fcl=0,msh=0,fsh=0,bcl=0;
    for(int i=0;i< checkboxGroupValues!.length;i++){
      if(checkboxGroupValues![i]=='Clothes for Men and Boys')
        mcl=1;
      else if(checkboxGroupValues![i]=='Clothes for Women and Girls')
        fcl=1;
      else if(checkboxGroupValues![i]=='Male Shoes')
        msh=1;
      else if(checkboxGroupValues![i]=='Female Shoes')
        fsh=1;
      else if(checkboxGroupValues![i]=='Baby Clothes')
        bcl=1;
    }
    try{
      var res=await http.post(Uri.parse(API.sendClothing),
          body:{//sunlen sb kch int hai table m.
            'userID':GuserId.toString(),
            'organizationID':GselectedOrganization.toString(),
            'maleClothes':mcl.toString(),
            'femaleClothes':fcl.toString(),
            'maleShoes':msh.toString(),
            'femaleShoes':fsh.toString(),
            'babyClothes':bcl.toString(),
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
            'Clothing Items',
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
                              'images/clothingDonation.jpg',
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
                        height: 400,
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
                                  'Choose Clothing Items:',
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
                                  10, 10, 10, 0),
                              child: FlutterFlowCheckboxGroup(
                                options: [
                                  'Clothes for Men and Boys',
                                  'Clothes for Women and Girls',
                                  'Baby Clothes',
                                  'Male Shoes',
                                  'Female Shoes',
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
                                    10, 0, 10, 0),
                                //initialized: checkboxGroupValues != null,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                              child: FFButtonWidget(
                                onPressed: () async{
                                  print('Button pressed ...');
                                  await storeClothing();
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
