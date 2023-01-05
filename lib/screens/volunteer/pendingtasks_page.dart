import 'package:floodaid/components/checkbox_group.dart';
import 'package:floodaid/components/themes.dart';
import 'package:flutter/material.dart';
import 'package:floodaid/components/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PendingTasks extends StatefulWidget {
  static String id = 'pendingtasks_page';
  const PendingTasks({Key? key}) : super(key: key);

  @override
  _PendingTasksState createState() => _PendingTasksState();
}

class _PendingTasksState extends State<PendingTasks> {
  List<String>? checkboxGroupValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff1b75bb),
          automaticallyImplyLeading: true,
          title: Align(
            alignment: AlignmentDirectional(-1, 0),
            child: Text(
              'My Tasks',
              style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          actions: [],
          centerTitle: true,
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
                          color: Color(0xFFFFFFFF),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: Image.asset(
                              'images/pending.png',
                            ).image,
                          ),
                          boxShadow: const[
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: 359,
                        height: 370,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Align(
                              alignment: AlignmentDirectional(-0.6, 0),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                                child: Text(
                                  'Pending Tasks:',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: FlutterFlowCheckboxGroup(
                                options: const [
                                  'Package Donation Items',
                                  'Provide Healthcare',
                                  'Rescue the effected',
                                ],
                                onChanged: (val) =>
                                    setState(() => checkboxGroupValues = val),
                                activeColor: Color(0xff1b75bb),
                                checkColor: Colors.white,
                                checkboxBorderColor: Color(0xFF95A1AC),
                                textStyle: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                itemPadding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                                //initialized: checkboxGroupValues != null,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  //print('Button pressed ...');
                                  Fluttertoast.showToast(msg: 'Response Submitted');
                                },
                                text: 'Submit',
                                options: const FFButtonOptions(
                                  width: double.infinity,
                                  height: 40,
                                  color: Color(0xff1b75bb),
                                  textStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                  elevation: 10,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
