import 'dart:convert';
import 'package:cadvizortestlibrary/View/pdfviewer.dart';
import 'package:cadvizortestlibrary/View/sub_design_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../Model/Binary_model.dart';
import 'qrcamera.dart';
import 'package:http/http.dart' as http;

class QRcodeScannerWiget extends StatefulWidget {
  QRcodeScannerWiget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QRcodeScannerWiget> {
  String qrResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '여기에 링크가 뜨게 됩니다.',
            ),
            Text(
              qrResult,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            if (qrResult != "")
              FutureBuilder<BinaryModel>(
                  future: GetSubDesignListAPI(qrResult),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(_createPdfViewerRoute(snapshot.data));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  child: Text("PDF View",
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
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Container();
                    }
                  })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressedFAB,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onPressedFAB() async {
    //비동기 실행으로 QR화면이 닫히기 전까지 await으로 기다리도록 한다.
    dynamic result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return QRCheckScreen(eventKeyword: 'jPDF');
    }));

    if (result != null) {
      setState(() {
        //qr스캐너에서 받은 결과값을 화면의 qrResult 에 적용하도록 한다.
        qrResult = result.toString();
      });
    }
  }
}

Route _createPdfViewerRoute(BinaryModel? subList) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        PdfViewer(subList!),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

Future<BinaryModel> GetSubDesignListAPI(String? jsonUrl) async {
  // 1. Call rest API
  final url = Uri.parse(jsonUrl!);
  final response = await http.get(url);
  var jObj = jsonDecode(response.body);
  var bm = BinaryModel.fromJson(jObj);

  return bm;
}

class QRCodeCreate extends StatelessWidget {
  const QRCodeCreate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          QrImage(
            data:
                "http://3.35.252.231:3238/mongodb/%23CADTEAM_library/jPDF/91102-P1680-0201.pdf",
            backgroundColor: Colors.white,
            size: 200,
          ),
          QrImage(
            data:
                "http://3.35.252.231:3238/mongodb/%23CADTEAM_library/jPDF/91102-P1680-0302.pdf",
            backgroundColor: Colors.white,
            size: 200,
          ),
          QrImage(
            data:
                "http://3.35.252.231:3238/mongodb/%23CADTEAM_library/jPDF/91102-P1680-0801.pdf",
            backgroundColor: Colors.white,
            size: 200,
          )
        ],
      ),
    );
  }
}
