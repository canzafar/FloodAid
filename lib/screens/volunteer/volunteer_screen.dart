import 'package:floodaid/components/icon_button.dart';
import 'package:floodaid/components/themes.dart';
import 'package:flutter/material.dart';
import 'package:floodaid/screens/volunteer/choosetasks_page.dart';
import 'package:floodaid/screens/volunteer/completedtasks_page.dart';
import 'package:floodaid/screens/volunteer/pendingtasks_page.dart';
import 'package:floodaid/screens/myProfile/profile_page.dart';

class VolunteerScreen extends StatefulWidget {
  static String id = 'volunteer_screen';
  const VolunteerScreen({Key? key}) : super(key: key);

  @override
  _VolunteerScreenState createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 16,
          backgroundColor: Color(0xFFF5F5F5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 350,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'images/volunteers3.png',
                      ).image,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // tasklist
                    Navigator.pushNamed(context, ChooseTasks.id);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.filter_list_alt,
                      color: Color(0xFF303030),
                    ),
                    title: Text(
                      'Task List',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                    contentPadding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // pendingtask
                    Navigator.pushNamed(context, PendingTasks.id);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.list_alt_outlined,
                      color: Color(0xFF303030),
                    ),
                    title: Text(
                      'My Tasks',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),

                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
                InkWell(
                  onTap: (){
                    // completedlist
                    Navigator.pushNamed(context, CompletedTasks.id);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.check,
                      color: Color(0xFF303030),
                    ),
                    title: Text(
                      'Completed Tasks',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff1b75bb),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.menu,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: (){
              // opendrawer
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-1, 0),
            child: Text(
              'Volunteer',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, -1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
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
                                    'images/volunteers1.png',
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Text(
                                  'Part Of Being A Person Is Helping Others',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                    child: Text(
                      'A Message From The  Developers',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                        child: Text(
                          'Thank you for your interest in volunteering. Your help will prove to be invaluable in aiding those affected by the recent flooding. You are the real heroes!\nThis help will not go unappreciated. Surely by helping others, you are helping yourself as well. We thank you for what you are doing to help others. It’s truly inspiring.',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 20, 10),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        fillColor: Color(0xFF1B75BB),
                        icon: Icon(
                          Icons.person,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, MyProfile.id);
                        },
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
