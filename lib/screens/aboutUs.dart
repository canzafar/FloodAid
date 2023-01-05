import 'package:floodaid/components/themes.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';


class Micard extends StatefulWidget {
  static String id = 'micard';

  @override
  _MicardState createState() => _MicardState();
}

class _MicardState extends State<Micard> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFE0E3E7),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'FLUTTER DEVELOPERS',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF57575F),
                      fontSize: 20,
                      letterSpacing: 4,
                    ),
                  ),
                  Divider(
                    height: 10,
                    thickness: 1,
                    indent: 60,
                    endIndent: 60,
                    color: Colors.black,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(20, 40, 20, 20),
                          child: Container(
                            width: 130,
                            height: 130,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'images/20221117_120514 (1)-modified.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        FlipCard(
                          fill: Fill.fillBack,
                          direction: FlipDirection.HORIZONTAL,
                          speed: 400,
                          front: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(10, 40, 20, 20),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                width: 190,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    Text(
                                      'Kanza Batool',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        color: Colors.black
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          back: Container(
                            width: 190,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                Text(
                                  'K200423@nu.edu.pk',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Container(
                            width: 130,
                            height: 130,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'images/Snapchat-1198430090-modified (1).png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        FlipCard(
                          fill: Fill.fillBack,
                          direction: FlipDirection.HORIZONTAL,
                          speed: 400,
                          front: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(10, 40, 20, 20),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                width: 190,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    Text(
                                      'Ayesha Ahmed',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                          color: Colors.black
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          back: Container(
                            width: 190,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                Text(
                                  'K200172@nu.edu.pk',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Container(
                            width: 130,
                            height: 130,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'images/Snapchat-1428055548-modified (1).png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        FlipCard(
                          fill: Fill.fillBack,
                          direction: FlipDirection.HORIZONTAL,
                          speed: 400,
                          front: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(10, 40, 20, 20),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                width: 190,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                    Text(
                                      'Tahreem Fatima',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                          color: Colors.black
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          back: Container(
                            width: 190,
                            height: 70,
                            decoration: BoxDecoration(
                              color:
                              Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                Text(
                                  'K200483@nu.edu.pk',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                      color: Colors.black
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
