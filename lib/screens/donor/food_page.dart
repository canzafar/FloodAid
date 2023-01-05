import 'dart:convert';
import 'package:floodaid/data.dart';
import 'package:floodaid/components/checkbox_group.dart';
import 'package:floodaid/components/themes.dart';
import 'thank_you.dart';
import 'package:floodaid/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:floodaid/api_connection/api_connection.dart';

class FoodScreen extends StatefulWidget {
  static String id = 'food_screen';
  const FoodScreen({Key? key}) : super(key: key);

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  List<String>? checkboxGroupValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  storeFood()async{
    int daal=0,water=0,oil=0,wheat=0,masala=0;
    for(int i=0;i< checkboxGroupValues!.length;i++){
      if(checkboxGroupValues![i]=='Atta / Wheat Flour')
        wheat=1;
      else if(checkboxGroupValues![i]=='Ghee / Oil')
        oil=1;
      else if(checkboxGroupValues![i]=='Daal')
        daal=1;
      else if(checkboxGroupValues![i]=='Masala Mix')
        masala=1;
      else if(checkboxGroupValues![i]=='Water')
        water=1;
    }
    try{
      var res=await http.post(Uri.parse(API.sendFood),
          body:{
            'userID':GuserId.toString(),
            'organizationID':GselectedOrganization.toString(),
            'wheat':wheat.toString(),
            'daal':daal.toString(),
            'masala_mix':masala.toString(),
            'oil':oil.toString(),
            'water':water.toString(),
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
        appBar: AppBar(
          backgroundColor: Color(0xFF3984EF),
          automaticallyImplyLeading: true,
          title: Align(
            alignment: AlignmentDirectional(-1, -1),
            child: Text(
              'Food Items',
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
                                'images/foodDonation.PNG',
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
                            children: <Widget>[
                              Align(
                                alignment: AlignmentDirectional(-0.6, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 0, 0),
                                  child: Text(
                                    'Choose Food Items:',
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
                                    'Atta / Wheat Flour',
                                    'Ghee / Oil',
                                    'Daal',
                                    'Masala Mix',//yeh opt agy pchy hn table k hisab se
                                    'Water'
                                  ],
                                  onChanged: (val) {
                                    setState(() => checkboxGroupValues = val);
                                    print(checkboxGroupValues);
                                  },

                                  activeColor: Color(0xFF3984EF),
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
                                  onPressed: ()async {
                                    print('Button pressed ...');
                                    await storeFood();
                                  },
                                  text: 'Donate Now',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40,
                                    color: Color(0xFF3984EF),
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
      ),
    );
  }
}
