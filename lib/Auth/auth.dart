import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cadvizortestlibrary/Model/Auth.dart';
import 'package:cadvizortestlibrary/View/platform.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:animated_snack_bar/animated_snack_bar.dart';
import '../amplifyconfiguration.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class AuthhomeWidget extends StatefulWidget {
  const AuthhomeWidget({Key? key}) : super(key: key);

  @override
  _AuthhomeWidgetState createState() => _AuthhomeWidgetState();
}

class _AuthhomeWidgetState extends State<AuthhomeWidget> {

  final _amplify = Amplify;
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  late bool passwordVisibility;
  late TextEditingController passwordConfirmController;
  late bool passwordConfirmVisibility;
  late TextEditingController emailAddressLoginController;
  late TextEditingController passwordLoginController;
  late bool passwordLoginVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String userEmail = '';
  late String userID = '';
  late String userPassword = '';
  late String userPasswordConfirm = '';

  @override
  void initState() {
    super.initState();
    _configureAmplify();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    passwordConfirmController = TextEditingController();
    passwordConfirmVisibility = false;
    emailAddressLoginController = TextEditingController();
    passwordLoginController = TextEditingController();
    passwordLoginVisibility = false;
  }

  void _configureAmplify() async{
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();

    _amplify.addPlugins([
      authPlugin,
    ]);

    try {
      await _amplify.configure(amplifyconfig);
      print('Successfully configured Amplify 🎉');
    } catch (e) {
      print('Could not configure Amplify ☠️');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: Color(0xFF14181B),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/loginback.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0x220F1113),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 90, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo1.png',
                          width: 200,
                          height: 170,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            isScrollable: true,
                            labelColor: Colors.white,
                            labelStyle: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFF0F1113),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            indicatorColor: Colors.white,
                            tabs: [
                              Tab(
                                text: 'Sign In',
                              ),
                              Tab(
                                text: 'Sign Up',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      54, 0, 54, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 0),
                                          child: TextFormField(
                                            textAlignVertical: TextAlignVertical.top,
                                            controller:
                                            emailAddressLoginController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              alignLabelWithHint: true,
                                              hintText : 'ID',
                                              hintStyle: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(20, 14, 20, 14),
                                            ),
                                            style: TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            onSaved: (value) {
                                              userID = value!;
                                            },
                                            onChanged: (value) {
                                              userID = value;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: TextFormField(
                                            controller: passwordLoginController,
                                            obscureText:
                                            !passwordLoginVisibility,
                                            decoration: InputDecoration(
                                              hintText: 'Password',
                                              hintStyle: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(20, 14, 20, 14),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                      () => passwordLoginVisibility =
                                                  !passwordLoginVisibility,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  passwordLoginVisibility
                                                      ? Icons
                                                      .visibility_outlined
                                                      : Icons
                                                      .visibility_off_outlined,
                                                  color: Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: TextStyle(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            onSaved: (value) {
                                              userPassword = value!;
                                            },
                                            onChanged: (value) {
                                              userPassword = value;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 24, 0, 0),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              final user =
                                              await GetAuthByRestAPI(
                                                  userID, userPassword);
                                              if (user == "") {
                                                AnimatedSnackBar.material(
                                                  'Please check your id or password',
                                                  type: AnimatedSnackBarType.error,
                                                  desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
                                                ).show(context);
                                              } else {
                                                Navigator.of(context).push(
                                                    _createPlatformRoute(user));
                                              }
                                            },
                                            child: Text('Login'),
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(170, 50),
                                              backgroundColor:
                                              Color(0xFF30AC9D),
                                              elevation: 3,
                                              textStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white,
                                                  fontFamily: 'Lexend Deca'),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 20, 0, 0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              print(
                                                  'Button-ForgotPassword pressed ...');
                                            },
                                            child: Text(
                                              'Forgot Password?',
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(200, 40),
                                              backgroundColor:
                                              Color(0x0039D2C0),
                                              elevation: 0,
                                              textStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontFamily: 'Outfit'),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: Text(
                                                  'Or use a social account to login',
                                                  style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xC8FFFFFF),
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 16, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF0F1113),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color(0x3314181B),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.google,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF0F1113),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color(0x3314181B),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.apple,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF0F1113),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color(0x3314181B),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.facebookF,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF0F1113),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color(0x3314181B),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: Icon(
                                                  Icons.phone_sharp,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      54, 0, 54, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        // AWS Amplify 예제 해보고 적용하자



                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 20, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: Text(
                                                    'Or use a social account to\n create account',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Color(0xC8FFFFFF),
                                                      fontSize: 16,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 16, 0, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF0F1113),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color(0x3314181B),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.google,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF0F1113),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color(0x3314181B),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.apple,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF0F1113),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color(0x3314181B),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.facebookF,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF0F1113),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 5,
                                                      color: Color(0x3314181B),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment:
                                                AlignmentDirectional(0, 0),
                                                child: Icon(
                                                  Icons.phone_sharp,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ),
                                            ],
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





Route _createPlatformRoute(Auth user) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        PlatformMainWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      return FadeTransition(
        opacity: animation, child: child,
      );
    },
  );
}


Future<dynamic> GetAuthByRestAPI(String id, String pw) async {
  dynamic user;

  final url = Uri.parse('http://3.35.252.231:3238/user/' + id + '/' + pw);
  final response = await http.get(url);
  if (response.body == "id error") {
    return "";
  } else if (response.body == "pw error") {
    return "";
  } else if (response.body == "") {
    return "";
  } else {
    Map? userMap = jsonDecode(response.body);
    user = Auth.fromJson(userMap);
    return user;
  }
}