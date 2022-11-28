import 'package:cadvizortestlibrary/View/connector.dart';
import 'package:cadvizortestlibrary/View/terminal.dart';
import 'package:cadvizortestlibrary/View/wire.dart';
import 'package:cadvizortestlibrary/View/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

final _drawerController = ZoomDrawerController();

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.Style1,
      menuScreen: MenuScreen(),
      mainScreen:
          CadvizorHome(title: "Home", zoomController: _drawerController),
      borderRadius: 24.0,
      showShadow: true,
      angle: -5.0,
      backgroundColor: Colors.white24,
      slideWidth: MediaQuery.of(context).size.width * 0.55,
      duration: const Duration(milliseconds: 500),
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.easeIn,
    );
  }
}

class CadvizorHome extends StatefulWidget {
  const CadvizorHome({Key? key, required this.title, this.zoomController})
      : super(key: key);
  final String title;
  final zoomController;

  @override
  State<CadvizorHome> createState() => _CadvizorHomeState();
}

class _CadvizorHomeState extends State<CadvizorHome> {
  PageController? pageViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5D41),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _drawerController.toggle!();
          },
        ),
        title: Text('CADvizor Library3.0',
            style: GoogleFonts.notoSans(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            )),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        notchMargin: 12,
        shape: CircularNotchedRectangle(),
        color: Color(0xFFFF5D41),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                icon: Icon(CupertinoIcons.back),
                color: Colors.white,
                iconSize: 30),
            IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.home),
                color: Colors.white,
                iconSize: 30),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(_createProfileRoute());
                },
                icon: Icon(CupertinoIcons.person_alt_circle),
                color: Colors.white,
                iconSize: 30),
          ],
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 3500,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
                  child: Container(
                    width: 100,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 500,
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                              child: PageView(
                                controller: pageViewController ??=
                                    PageController(initialPage: 0),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/irLogo.png',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/CADvizor_Logic.png',
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/CADVizor_MFG.png',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/vehicle-wiring-harness-market.jpg',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: SmoothPageIndicator(
                                  controller: pageViewController ??=
                                      PageController(initialPage: 0),
                                  count: 4,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) {
                                    pageViewController!.animateToPage(
                                      i,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  effect: ExpandingDotsEffect(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 0, 7, 7),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(_createWireRoute());
                    },
                    child: Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
                        child: Stack(children: [
                          Align(
                            alignment: AlignmentDirectional(0.06, -0.2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/images/wire.jpg',
                                  width: 300,
                                  height: 150,
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1, 1),
                            child: Text(
                              'Wire',
                              style: GoogleFonts.notoSans(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 25),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 0, 7, 7),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(_createConnectorRoute());
                    },
                    child: Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/prdt-idx01.png',
                                  width: 300,
                                  height: 100,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1, 1),
                              child: Text(
                                'Connector',
                                textAlign: TextAlign.end,
                                style: GoogleFonts.notoSans(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 25),
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
                  padding: EdgeInsetsDirectional.fromSTEB(7, 0, 7, 7),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 7,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(_createTerminalRoute());
                            },
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Theme.of(context).platform ==
                                          TargetPlatform.windows
                                      ? AlignmentDirectional(0, 0)
                                      : AlignmentDirectional(-0.5, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/terminal.jpg',
                                      width: 130,
                                      height: 100,
                                      fit: BoxFit.fitWidth,
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 1),
                                  child: Text(
                                    'Terminal',
                                    style: GoogleFonts.notoSans(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 14,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/seal.jpg',
                                    width: 200,
                                    height: 100,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1, 1),
                                child: Text(
                                  'Seal',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.notoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 0, 7, 7),
                  child: Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Image.asset(
                            'assets/images/etcparts.png',
                            width: 300,
                            height: 100,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1, 1),
                          child: Text(
                            'ETC',
                            style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 0, 7, 7),
                  child: Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/device.png',
                              width: 300,
                              height: 100,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1, 1),
                          child: Text(
                            'Device',
                            style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 25),
                            ),
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
    );
  }
}

Route _createWireRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        WireListWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createConnectorRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ConnectorListWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 2.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createTerminalRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        TerminalListWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createProfileRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ProfilePageWidget(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          )),
          child: ListView(
            padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
            children: [
              Container(
                height: 200,
                child: DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        padding: EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: DecoratedBox(
                          decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage('assets/images/User.jpg'),
                              )),
                        ),
                      ),
                      Text(
                        "JIMIN",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "CADTEAM",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      InkWell(
                        onTap: () {
                          print("Edit profile");
                        },
                        child: Text(
                          "YURA",
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {

                },
              ),
              ListTile(
                title: Text("Products",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500)),
                onTap: () {},
              ),
              ListTile(
                title: Text("Services",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500)),
                onTap: () {},
              ),
              ListTile(
                title: Text("Payment",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500)),
              ),
              ListTile(
                title: Text("Refer & Earn",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500)),
                onTap: () {},
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(
                color: Colors.blue[100],
                thickness: 2,
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                title: Text("Contact Us",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500)),
                onTap: () {},
              ),
              ListTile(
                title: Text("About Us",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w500)),
                onTap: () {},
              ),
              Container(
                margin: EdgeInsets.only(right: 300.0),
                child: ListTile(
                    tileColor: Colors.white,
                    title: Text("Logout",
                        style: TextStyle(
                          color: Colors.white38,
                        )),
                    onTap: () {
                      Navigator.of(context).pop(context);
                    }),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
