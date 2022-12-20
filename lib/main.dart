import 'package:flutter/material.dart';
import 'package:cadvizortestlibrary/Auth/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delayed_display/delayed_display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashWidget(),
    );
  }
}

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Duration initialDelay = Duration(milliseconds: 300,);
  final animationsMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional(0, 0),
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional(0, 0),
                      children: [
                        Image.asset(
                          'assets/images/loginback.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40, 0, 40, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'assets/images/logo1.png',
                                      width: 80,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40, 0, 40, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        DelayedDisplay(
                                          delay : initialDelay,
                                          child: Text(
                                            'Make Your\nManufacturing\nDesign Easy',
                                            style: GoogleFonts.getFont(
                                              'Quicksand',
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 42,
                                                fontWeight:
                                                    FontWeight.w500,
                                                height: 1.2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 40, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: DelayedDisplay(
                                              delay : Duration(milliseconds: initialDelay.inMilliseconds + 500),
                                              child: Text(
                                                'Easily design your manufacturing drawings and get your BOM quickly',
                                                style: GoogleFonts.getFont(
                                                  'Quicksand',
                                                  textStyle: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.3),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40, 0, 40, 0),
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: DelayedDisplay(
                                              delay : Duration(milliseconds: initialDelay.inMilliseconds + 1000),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      _createAuthformRoute());
                                                },
                                                child: Text('Continue'),
                                                style:
                                                    ElevatedButton.styleFrom(
                                                        fixedSize:
                                                            Size(130, 50),
                                                        backgroundColor:
                                                            Color(0xFF30AC9D),
                                                        elevation: 3,
                                                        textStyle: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.white,
                                                            fontFamily:
                                                                'Lexend Deca'),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50),
                                                          side: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                        )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createAuthformRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AuthhomeWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
