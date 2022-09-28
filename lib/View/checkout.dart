import 'package:cadvizortestlibrary/View/loading.dart';
import 'package:flutter/material.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({Key? key}) : super(key: key);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F4F8),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(
              Icons.chevron_left_rounded,
              color: Color(0xFF57636C),
              size: 30,
            ),
        ),
        title: Text(
          'Subscription / Payment',
          style: TextStyle(
                fontFamily: 'Outfit',
                color: Color(0xFF14181B),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$180/yr',
                              style:
                              TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF14181B),
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 8, 0),
                                    child: Icon(
                                      Icons.date_range_rounded,
                                      color: Color(0xFF14181B),
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    'May 27, 2022 - May 26, 2023',
                                    style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF14181B),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/images/sub3.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              'Sub Report',
                              style:
                              TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF14181B),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24,
                  thickness: 2,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xFFF1F4F8),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                          child: Text(
                            'Payment',
                            style:
                            TextStyle(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF14181B),
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Icon(
                          Icons.credit_card,
                          color: Color(0xFF57636C),
                          size: 24,
                        ),
                      ),
                      Text(
                        'Ending in 2910',
                        style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Color(0xFF57636C),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24,
                  thickness: 2,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xFFF1F4F8),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                          child: Text(
                            'Promos',
                            style:
                            TextStyle(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF14181B),
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Icon(
                          Icons.attach_money_rounded,
                          color: Color(0xFF57636C),
                          size: 24,
                        ),
                      ),
                      Text(
                        'Annual(save \$12)',
                        style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Color(0xFF57636C),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24,
                  thickness: 2,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xFFF1F4F8),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price Details',
                        style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFF14181B),
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub-design Report',
                              style:
                              TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF14181B),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                            ),
                            Text(
                              '\$162/yr',
                              style:
                              TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF14181B),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax Fee',
                              style:
                              TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF14181B),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                            ),
                            Text(
                              '\$18/yr',
                              style:
                              TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF14181B),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24,
                  thickness: 2,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xFFF1F4F8),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Rate',
                        style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFF14181B),
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        '\$180/yr',
                        style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFF14181B),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24,
                  thickness: 2,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xFFF1F4F8),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Text(
                      'The Google Play payment system is a service that allows you to sell digital products and content from your Android app. You can use the Google Play billing system to sell one-time products or recurring subscription products. Learn more about integrating the Google Play payment system into your app on the Android Developers site.',
                      style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: ElevatedButton(
                    onPressed: () {
                          Navigator.of(context).push(_createLoadingRoute());
                    },
                    child: Text('Pay the plan',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      elevation: 2,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Color(0xFFFE2E3C),
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


Route _createLoadingRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoadingScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}