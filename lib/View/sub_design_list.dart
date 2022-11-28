import 'dart:convert';
import 'package:cadvizortestlibrary/View/pdfviewer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../Model/Binary_model.dart';

class SubDesignListWidget extends StatefulWidget {
  const SubDesignListWidget({Key? key}) : super(key: key);

  @override
  _SubDesignListWidgetState createState() => _SubDesignListWidgetState();
}

class _SubDesignListWidgetState extends State<SubDesignListWidget> {
  TextEditingController? searchBarController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    searchBarController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFE2E3C),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Sub-Design List',
            style: TextStyle(
              fontFamily: 'Brazila',
              color: Colors.white,
              fontSize: 22,
            )),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 8, 0),
                    child: TextFormField(
                      controller: searchBarController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Search for sub design...',
                        labelStyle: TextStyle(
                          backgroundColor: Colors.transparent,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          fontFamily: 'Outfit',
                        ),
                        hintStyle: TextStyle(
                          backgroundColor: Color(0xFF57636C),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          fontFamily: 'Outfit',
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF1F4F8),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 17, 17, 24),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF57636C),
                          size: 16,
                        ),
                      ),
                      style: TextStyle(
                        backgroundColor: Color(0xFF1D2429),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        fontFamily: 'Outfit',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 12, 0),
                  child: IconButton(
                    //borderColor: Colors.transparent,
                    //borderRadius: 30,
                    //borderWidth: 1,
                    //buttonSize: 50,
                    icon: Icon(
                      Icons.search_sharp,
                      color: Color(0xFF1D2429),
                      size: 30,
                    ),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 5),
                    child: Text(
                      'PartNumber List',
                      style: TextStyle(
                        color: Color(0xFF1D2429),
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        fontFamily: 'Outfit',
                      ),
                    ),
                  ),
                  FutureBuilder<BinaryMap>(
                      future: GetSubDesignListAPI(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return _PartNumberListInit(snapshot.data);
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          return Container();
                        }
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PartNumberListInit extends StatelessWidget {
  BinaryMap? _subList;

  _PartNumberListInit(this._subList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      child: ListView.builder(
          itemCount: _subList?.binarys.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(_createPdfViewerRoute(_subList!.binarys[index]));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/pdficon.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Text(_subList!.binarys[index].id,
                              style: TextStyle(
                                color: Color(0xFF1D2429),
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Outfit',
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

Future<BinaryMap> GetSubDesignListAPI() async {
  // 1. Call rest API
  final url = Uri.parse(
      'http://3.35.252.231:3238/mongodb/%23CADTEAM_library/jPDF');
  final response = await http.get(url);
  var jObj = jsonDecode(response.body);
  var bm = BinaryMap.fromJson(jObj);

  return bm;
}

class BinaryMap {
  final List<BinaryModel> binarys;

  BinaryMap({required this.binarys,});

  factory BinaryMap.fromJson(List<dynamic> parsedJson){
    List<BinaryModel> binarys = <BinaryModel>[];
    binarys = parsedJson.map((e) => BinaryModel.fromJson(e)).toList();

    return new BinaryMap(binarys: binarys);
  }
}


Route _createPdfViewerRoute(BinaryModel? subList) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => PdfViewer(subList!),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      return FadeTransition(
        opacity: animation, child: child,
      );
    },
  );
}