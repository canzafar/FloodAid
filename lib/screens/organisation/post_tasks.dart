import 'package:floodaid/components/themes.dart';
import 'package:floodaid/components/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
as smooth_page_indicator;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:floodaid/api_connection/api_connection.dart';
import '../../data.dart';
import 'dart:convert';


class PostTasks extends StatefulWidget {
  static String id = 'post_tasks';
  const PostTasks({Key? key}) : super(key: key);

  @override
  _PostTasksState createState() => _PostTasksState();
}

class _PostTasksState extends State<PostTasks> {
  PageController? pageViewController;
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  uploadTask()async{
    try{
      var res=await http.post(Uri.parse(API.uploadTask),
          body:{
            'organizationID':GorganizationId.toString(),
            'task':textController1.text.trim().toString(),
            'region':textController2.text.trim().toString(),
            'date':textController1.text.trim().toString(),
          });
      if(res.statusCode==200){
        var resBody=jsonDecode(res.body);
        if(resBody['success']){
          Fluttertoast.showToast(msg: "Task Submitted");
          setState(() {
            textController1.clear();
            textController2.clear();
            textController3.clear();
          });
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
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF1B75BB),
        automaticallyImplyLeading: true,
        title: const Text(
          'Assign Task',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
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
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 40),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: 350,
                        height: 300,
                        constraints: const BoxConstraints(
                          maxWidth: 350,
                          maxHeight: 450,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                                child: PageView(
                                  controller: pageViewController ??=
                                      PageController(initialPage: 1),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Image.asset(
                                      'images/relief1.jpg',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'images/relief2.jpg',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'images/relief3.jpg',
                                      width: 100,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child:
                                  smooth_page_indicator.SmoothPageIndicator(
                                    controller: pageViewController ??=
                                        PageController(initialPage: 1),
                                    count: 3,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) {
                                      pageViewController!.animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: const smooth_page_indicator
                                        .ExpandingDotsEffect(
                                      expansionFactor: 2,
                                      spacing: 8,
                                      radius: 16,
                                      dotWidth: 16,
                                      dotHeight: 16,
                                      dotColor: Color(0xFF9E9E9E),
                                      activeDotColor: Color(0xFF3F51B5),
                                      paintStyle: PaintingStyle.fill,
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
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(30, 10, 20, 10),
                          child: TextFormField(
                            controller: textController1,
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController1',
                              Duration(milliseconds: 2000),
                                  () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Enter Task',
                              hintStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF57636C),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF1B75BB),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF1B75BB),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              prefixIcon: const Icon(
                                Icons.list,
                                color: Colors.black45,
                                size: 30,
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF57636C),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 0, 20, 10),
                          child: TextFormField(
                            controller: textController2,
                            onChanged: (_) => EasyDebounce.debounce(
                              'textController2',
                              Duration(milliseconds: 2000),
                                  () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Enter Region',
                              hintStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF57636C),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF1B75BB),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF1B75BB),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.white70, //Color(0xFFFFFFFF)
                              prefixIcon: const Icon(
                                Icons.location_pin,
                                color: Colors.black45,
                                size: 30
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 20, 10),
                        child: TextFormField(
                          controller: textController3,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Enter Date',
                            hintStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF57636C),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF1B75BB),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF1B75BB),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF1B75BB),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white70,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            prefixIcon: Icon(
                              Icons.calendar_today_sharp,
                              color: Colors.black45,
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 5, 20, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            print('Button pressed ...');
                            await uploadTask();
                          },
                          text: 'Submit',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40,
                            color: Color(0xFF1B75BB),
                            textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 30.0,
                          ),
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
