import 'dart:async';
import 'dart:convert';
import 'package:cadvizortestlibrary/Model/JWire.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:data_table_2/data_table_2.dart';

class WireListWidget extends StatefulWidget {
  const WireListWidget({Key? key}) : super(key: key);

  @override
  State<WireListWidget> createState() => _WireListWidgetState();
}

class _WireListWidgetState extends State<WireListWidget> {

  @override
  Widget build(BuildContext context) {
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
          'Wire',
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25),),
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
                      'assets/images/vehicle-wiring-harness-market.jpg',
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
                      style: GoogleFonts.notoSans(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15),),
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder<List<JWire>>(
              future: GetWireByRestAPI(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return DataTable2Build(jWireList: snapshot.data);
                }else if(snapshot.hasError){
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
              },
            )
          ],
        ),
      ),
    );
  }
}

class DataTable2Build extends StatefulWidget {
  final List<JWire>? jWireList;
  DataTable2Build({Key? key, required this.jWireList}) : super(key: key);

  @override
  State<DataTable2Build> createState() => _DataTable2BuildState(jWireList);
}

class _DataTable2BuildState extends State<DataTable2Build> {
  _DataTable2BuildState(List<JWire>? this.jWireList);
  List<JWire>? jWireList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 700,
        width: double.infinity,
        child: DataTable2(
          columnSpacing: 7,
          horizontalMargin: 2,
          minWidth: 400,
          columns: [
            DataColumn2(
              label: Text('Material'),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: Text('OD(mm)'),
            ),
            DataColumn2(
              label: Text('CSA'),
            ),
            DataColumn2(
              label: Text('Mfr'),
            ),
          ],
          rows: List<DataRow>.generate(jWireList!.length, (index) => DataRow(cells: [
            DataCell(Text(jWireList![index].material.name)),
            DataCell(Text(jWireList![index].outsideDiameter.toString())),
            DataCell(Text(jWireList![index].crossSectionArea.toString())),
            DataCell(Text(jWireList![index].manufacturer)),
          ]))
        ),
      ),
    );
  }
}

class WireDataGrid {
  late String material;
  late String OD;
  late String CSA;
  late String Mfr;

  WireDataGrid(this.material, this.OD, this.CSA, this.Mfr);
}



Future<List<JWire>> GetWireByRestAPI() async {
  List<JWire> result = <JWire>[];
  // 1. Call rest API
  final url = Uri.parse(
      'http://3.35.252.231:3238/mongodb/%23CADTEAM_library/jWire');
  final response = await http.get(url);

  // 2. json str -> json obj -> dart obj (LibraryBasis)
  var jObjList = json.decode(response.body);
  jObjList.forEach((jObj) {
    try {
      JWire dartObj = JWire.fromJson(jObj);
      result.add(dartObj);
    } catch (e) {}
  });

  return result;
}