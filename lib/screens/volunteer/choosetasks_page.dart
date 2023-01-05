import 'package:floodaid/components/checkbox_group.dart';
import 'package:floodaid/components/widgets.dart';
import 'package:floodaid/data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChooseTasks extends StatefulWidget {
  static String id = 'choosetasks_page';
  const ChooseTasks({Key? key}) : super(key: key);

  @override
  _ChooseTasksState createState() => _ChooseTasksState();
}

class _ChooseTasksState extends State<ChooseTasks> {
  List<String>? checkboxGroupValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    getTaskOption();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          const SliverAppBar(
            pinned: false,
            floating: false,
            backgroundColor: Color(0xff1b75bb),
            automaticallyImplyLeading: true,
            title: Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Text(
                'Task List',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
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
                            width: 350,//task_table k tasks khn gaye? agya
                            height: 200,//is page py jo organisation ne task daly hain wo show krne hain
                            decoration: BoxDecoration(
                              color: Colors.white,//yeh pages dusre hn khn krwani
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'images/vmsg_cleanup.png',
                                ).image,
                              ),
                              boxShadow: const [
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
                            width: 350,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Align(
                                  alignment: AlignmentDirectional(-0.6,0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 30, 0, 0),
                                    child: Text(
                                      'Choose A Responsibilty:',
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 0),
                                  child: FlutterFlowCheckboxGroup(
                                    options:getTaskOption(),
                                    onChanged: (val) => setState(
                                            () => checkboxGroupValues = val),
                                    activeColor:  const Color(0xff1b75bb),
                                    checkColor: Colors.white,
                                    checkboxBorderColor: const Color(0xFF95A1AC),
                                    textStyle: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                    itemPadding: const EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
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
            );
          },
        ),
      ),
    );
  }
}
