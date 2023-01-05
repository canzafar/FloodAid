import 'package:floodaid/components/icon_button.dart';
import 'package:floodaid/components/themes.dart';
import 'package:floodaid/screens/donor/food_page.dart';
import 'package:floodaid/screens/donor/money_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:floodaid/screens/donor/health_page.dart';
import 'package:floodaid/screens/donor/shelter_page.dart';
import 'package:floodaid/screens/donor/clothing_page.dart';
import 'package:floodaid/screens/donor/hygiene_page.dart';

class Donate extends StatefulWidget {
  static String id = 'donor_screen';
  const Donate({Key? key}) : super(key: key);

  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF1B75BB),
        automaticallyImplyLeading: true,
        title: Text(
          'Donate',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryBtnText,
                fontSize: 25,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
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
                            'images/image.png',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0.85),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                          child: Text(
                            'WE ARE IN THIS TOGETHER',
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Work Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.85, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Text(
                      'Causes',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 9,
                      mainAxisSpacing: 9,
                      childAspectRatio: 0.99,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 70,
                                icon: FaIcon(
                                  FontAwesomeIcons.moneyBillWave,
                                  color: Color(0xFF34A054),
                                  size: 50,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, MoneyScreen.id);
                                },
                              ),
                            ),
                            Text(
                              'Money',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                      fontFamily: 'Work Sans',
                                      fontSize: 16,
                                      color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 70,
                                icon: Icon(
                                  Icons.fastfood_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  size: 50,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, FoodScreen.id);
                                },
                              ),
                            ),
                            Text(
                              'Food ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Work Sans',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 70,
                                icon: Icon(
                                  Icons.favorite_rounded,
                                  color: Color(0xFFF50E0E),
                                  size: 50,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, HealthScreen.id);
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Text(
                              'Health',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                      fontFamily: 'Work Sans',
                                      fontSize: 16,
                                      color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 70,
                                icon: Icon(
                                  Icons.night_shelter_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 50,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, ShelterScreen.id);
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Text(
                              'Shelter ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                      fontFamily: 'Work Sans',
                                      fontSize: 16,
                                      color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 70,
                                icon: FaIcon(
                                  FontAwesomeIcons.shirt,
                                  color: Color(0xFFE739EF),
                                  size: 50,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, ClothingScreen.id);
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Text(
                              'Clothing',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                      fontFamily: 'Work Sans',
                                      fontSize: 16,
                                      color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 70,
                                icon: Icon(
                                  Icons.soap_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  size: 50,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, HygieneScreen.id);
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Text(
                              'Hygiene',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                      fontFamily: 'Work Sans',
                                      fontSize: 16,
                                      color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
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
