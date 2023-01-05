import 'dart:convert';
import 'package:floodaid/api_connection/api_connection.dart';
import 'package:floodaid/data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart'as http;


class InventoryScreen extends StatefulWidget {
  static String id = 'inventory_screen';
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  void initState(){
    getMoney();
    getFood();
    getHealth();
    getShelter();
    getClothing();
    getHygiene();
    super.initState();
  }

  double money=0,food=0,health=0,shelter=0,clothing=0,hygiene=0;
  int totalMoneyOrganization=0;
  int totalFoodOrganization=0;
  int totalHealthOrganization=0;
  int totalShelterOrganization=0;
  int totalClothingOrganization=0;
  int totalHygieneOrganization=0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  getMoney()async{
    try{
      var res=await http.post(
        Uri.parse(API.getMoney),
        body:
        {
        'id': GorganizationId.toString()
      });
      if(res.statusCode==200){
        var resBody=jsonDecode(res.body);
        if(resBody['success']){
          int totalMoney=(resBody['totalFunds']);
          int organizationFunds=(resBody['organizationFunds']);
          setState(() {
            money = organizationFunds / totalMoney ;
            totalMoneyOrganization=organizationFunds;
            totalMoneyOrganization=totalMoneyOrganization.round();
            //print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm $money");
          });

        }
        else{
          Fluttertoast.showToast(msg: "Error please try again");
        }
      }
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  getFood()async{
    try{
      var res=await http.post(
          Uri.parse(API.getFood),
          body:
          {
            'id': GorganizationId.toString()
          });
      if(res.statusCode==200){
        var resBody=jsonDecode(res.body);
        //print(res.body);
        if(resBody['success']){
          int totalFood=(resBody['totalFood']);
          int organizationFood=(resBody['organizationFood']);
          setState(() {
            food= organizationFood / totalFood ;
            totalFoodOrganization=organizationFood;
            totalFoodOrganization=totalFoodOrganization.round();
            //print("fffffffffffffffffffffffffffffffffffffffffff $food");
          });

        }
        else{
          Fluttertoast.showToast(msg: "Error please try again");
        }
      }
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  getHealth()async{
    try{
      var res=await http.post(
          Uri.parse(API.getHealth),
          body:
          {
            'id': GorganizationId.toString()
          });
      if(res.statusCode==200){
        var resBody=jsonDecode(res.body);
        print(res.body);
        if(resBody['success']){
          int totalHealth=(resBody['totalHealth']);
          int organizationHealth=(resBody['organizationHealth']);
          setState(() {
            health = organizationHealth / totalHealth ;
            totalHealthOrganization=organizationHealth;
            totalHealthOrganization=totalHealthOrganization.round();
           // print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh $health");
          });

        }
        else{
          Fluttertoast.showToast(msg: "Error please try again");
        }
      }
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  getShelter()async{
    try{
      var res=await http.post(
          Uri.parse(API.getShelter),
          body:
          {
            'id': GorganizationId.toString()
          });
      if(res.statusCode==200){
        print(res.body);
        var resBody=jsonDecode(res.body);
        if(resBody['success']){
          int totalShelter=(resBody['totalShelter']);
          int organizationShelter=(resBody['organizationShelter']);
          setState(() {
            shelter= organizationShelter / totalShelter ;
            totalShelterOrganization=organizationShelter;
            totalShelterOrganization=totalShelterOrganization.round();
            //print("sssssssssssssssssssssssssssssssssssssssssssssssssss $shelter");
          });

        }
        else{
          Fluttertoast.showToast(msg: "Error please try again");
        }
      }
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  getClothing()async{
    try{
      var res=await http.post(
          Uri.parse(API.getClothing),
          body:
          {
            'id': GorganizationId.toString()
          });
      if(res.statusCode==200){
        var resBody=jsonDecode(res.body);
        print(res.body);
        if(resBody['success']){
          int totalClothing=(resBody['totalClothing']);
          int organizationClothing=(resBody['organizationClothing']);
          setState(() {
            clothing= organizationClothing / totalClothing;
            totalClothingOrganization=organizationClothing;
            totalClothingOrganization=totalClothingOrganization.round();
            //print("cccccccccccccccccccccccccccccccccccccccccccccccccccccc $clothing");
          });

        }
        else{
          Fluttertoast.showToast(msg: "Error please try again");
        }
      }
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  getHygiene()async{
    try{
      var res=await http.post(
          Uri.parse(API.getHygiene),
          body:
          {
            'id': GorganizationId.toString()
          });
      if(res.statusCode==200){
        var resBody=jsonDecode(res.body);
        print(res.body);
        if(resBody['success']){
          int totalHygiene=(resBody['totalHygiene']);
          int organizationHygiene=(resBody['organizationHygiene']);
          setState(() {
            hygiene = organizationHygiene / totalHygiene;
            totalHygieneOrganization=organizationHygiene;
            totalHygieneOrganization=totalHygieneOrganization.round();
            //print("ggggggggggggggggggggggggggggggggggggggggggggggggggg $hygiene");
          });

        }
        else{
          Fluttertoast.showToast(msg: "Error please try again");
        }
      }
    }catch(e){
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
          backgroundColor: const Color(0xFF1B75BB),
          automaticallyImplyLeading: true,
          title: const Text(
            'Inventory',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Text(
                                'Money',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.05, 0),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                                child: LinearPercentIndicator(
                                  percent: money,
                                  width: 350,
                                  lineHeight: 24,
                                  animation: true,
                                  progressColor: Color(0xFF1B75BB),
                                  backgroundColor: Color(0xFFF1F4F8),
                                  center: Text(
                                    totalMoneyOrganization.toString()+' Pkr',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0C0C0C),
                                    ),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ],
                        ),//ek min kat@gmail.com //pass: 123
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Text(
                                'Food',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.05, 0),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                                child: LinearPercentIndicator(
                                  percent:  food,
                                  width: 350,
                                  lineHeight: 24,
                                  animation: true,
                                  progressColor: Color(0xFF1B75BB),
                                  backgroundColor: Color(0xFFF1F4F8),
                                  center: Text(
                                    totalFoodOrganization.toString()+' Items',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0C0C0C),
                                    ),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.05, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                child: Text(
                                  'Health',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.05, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: LinearPercentIndicator(
                                    percent: health ,
                                    width: 350,
                                    lineHeight: 24,
                                    animation: true,
                                    progressColor: Color(0xFF1B75BB),
                                    backgroundColor: Color(0xFFF1F4F8),
                                    center: Text(
                                      totalHealthOrganization.toString()+' Items',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0C0C0C),
                                      ),
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.05, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                child: Text(
                                  'Shelter',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.05, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: LinearPercentIndicator(
                                    percent: shelter ,
                                    width: 350,
                                    lineHeight: 24,
                                    animation: true,
                                    progressColor: Color(0xFF1B75BB),
                                    backgroundColor: Color(0xFFF1F4F8),
                                    center: Text(
                                      totalShelterOrganization.toString()+' Items',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0C0C0C),
                                      ),
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.05, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                child: Text(
                                  'Clothing ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.05, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: LinearPercentIndicator(
                                    percent: clothing ,
                                    width: 350,
                                    lineHeight: 24,
                                    animation: true,
                                    progressColor: Color(0xFF1B75BB),
                                    backgroundColor: Color(0xFFF1F4F8),
                                    center: Text(
                                      totalClothingOrganization.toString()+' Items',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0C0C0C),
                                      ),
                                    ),
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                              child: Text(
                                'Hygiene',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.05, 0),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                child: LinearPercentIndicator(
                                  percent: hygiene ,
                                  width: 350,
                                  lineHeight: 24,
                                  animation: true,
                                  progressColor: Color(0xFF1B75BB),
                                  backgroundColor: Color(0xFFF1F4F8),
                                  center: Text(
                                    totalHygieneOrganization.toString()+' Items',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0C0C0C),
                                    ),
                                  ),
                                  padding: EdgeInsets.zero,
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
      ),
    );
  }
}
