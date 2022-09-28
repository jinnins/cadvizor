import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/JConnector.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ConnectorListWidget extends StatefulWidget {
  const ConnectorListWidget({Key? key}) : super(key: key);

  @override
  State<ConnectorListWidget> createState() => _ConnectorListWidgetState();
}

class _ConnectorListWidgetState extends State<ConnectorListWidget> {
  late double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width * 0.45;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5D41),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            print("IconButton pressed...");
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          'Connector',
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF3F3F3),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Image.asset(
                              'assets/images/Logo.png',
                              width: 100,
                              height: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xFFF9F9F9),
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                              child: Icon(
                                Icons.search_rounded,
                                color: Color(0xFF95A1AC),
                                size: 24,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: TextFormField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Search events here...',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF95A1AC),
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.95, 0),
                                child: Icon(
                                  Icons.tune_rounded,
                                  color: Color(0xFF95A1AC),
                                  size: 24,
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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/jointconnector.png',
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 20, 0),
                    child: Text(
                      'View All',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            LibraryBasisDataFromId(),
          ],
        ),
      ),
    );
  }
}

class LibraryBasisDataFromId extends StatefulWidget {
  LibraryBasisDataFromId({Key? key}) : super(key: key);

  @override
  State<LibraryBasisDataFromId> createState() => _LibraryBasisDataFromIdState();
}

class _LibraryBasisDataFromIdState extends State<LibraryBasisDataFromId> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<JConnector>>(
        future: GetConnectorByRestAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _containerConnector(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Padding(
              padding: EdgeInsetsDirectional.only(bottom: 30),
              child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Color(0xFFFF5D41),
                    size: 80,
                  )),
            );
          }
        });
  }
}

class _containerConnector extends StatelessWidget {
  List<JConnector>? lList;

  _containerConnector(this.lList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(100, (index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x3600000F),
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Stack(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mfr.Part#',
                            style: GoogleFonts.notoSans(
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 13),
                            ),
                          ),
                          Text(
                            lList?[index] != null
                                ? lList![index].manufacturerNumber.toString()
                                : "",
                            style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Number of Cavites',
                            style: GoogleFonts.notoSans(
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 13),
                            ),
                          ),
                          Text(
                            lList?[index] != null
                                ? lList![index].numberOfCavities.toString()
                                : "",
                            style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 13),
                            ),
                          ),
                        ]),
                    Container(
                      width: 180,
                      height: 85,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  scrollable: true,
                                  title: Text(
                                    lList?[index] != null
                                        ? lList![index]
                                        .manufacturerNumber
                                        .toString()
                                        : "",
                                    style: GoogleFonts.notoSans(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 15)),
                                  ),
                                  content: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Form(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Series : " +
                                                lList![index]
                                                    .series
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Internal Number : " +
                                                lList![index]
                                                    .internalNumber
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Status : " +
                                                lList![index]
                                                    .status
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Mfr : " +
                                                (lList?[index] != null
                                                    ? lList![index]
                                                    .manufacturer
                                                    .toString()
                                                    : ""),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Type : " +
                                                (lList?[index] != null
                                                    ? lList![index]
                                                    .type
                                                    .toString()
                                                    : ""),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "SubType : " +
                                                (lList?[index] != null
                                                    ? lList![index]
                                                    .subType
                                                    .toString()
                                                    : ""),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Description : " +
                                                lList![index]
                                                    .description
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Cost : " +
                                                lList![index]
                                                    .cost
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Close"),
                                    )
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.file_open),
                        color: Colors.black38,
                        iconSize: 18,
                        alignment: Alignment.bottomRight,
                      ),
                    )
                  ]),
                ),
              ),
            ),
          );
        }).toList());
  }
}

Future<List<JConnector>> GetConnectorByRestAPI() async {
  List<JConnector> result = <JConnector>[];
  // 1. Call rest API
  final url = Uri.parse(
      'http://3.35.252.231:3238/mongodb/%23CADTEAM_library/jConnector');
  final response = await http.get(url);

  // 2. json str -> json obj -> dart obj (LibraryBasis)
  var jObjList = json.decode(response.body);
  jObjList.forEach((jObj) {
    try {
      JConnector dartObj = JConnector.fromJson(jObj);
      result.add(dartObj);
    } catch (e) {}
  });

  return result;
}
