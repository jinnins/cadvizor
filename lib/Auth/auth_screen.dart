import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cadvizortestlibrary/Model/Auth.dart';
import 'package:cadvizortestlibrary/View/platform.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import '../amplifyconfiguration.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'auth_service.dart';

class AuthhomeWidget extends StatefulWidget {
  const AuthhomeWidget({Key? key}) : super(key: key);

  @override
  _AuthhomeWidgetState createState() => _AuthhomeWidgetState();
}

class _AuthhomeWidgetState extends State<AuthhomeWidget> {
  final _amplify = Amplify;
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
  //  _configureAmplify();
    _authService.showLogin();
  }
/*
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
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                                // Login
                                // SignUP
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