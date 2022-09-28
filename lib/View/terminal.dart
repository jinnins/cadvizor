import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TerminalListWidget extends StatefulWidget {
  const TerminalListWidget({Key? key}) : super(key: key);

  @override
  State<TerminalListWidget> createState() => _TerminalListWidgetState();
}

class _TerminalListWidgetState extends State<TerminalListWidget> {
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
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                  GetContainerData(_width, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container GetContainerData(double w, BuildContext ctx) {
  return Container(
    width: w,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: Color(0x3600000F),
          offset: Offset(0, 1),
        )
      ],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                  child: Text(
                    'Mfr.Part#: MG' + Random().nextInt(999999).toString(),
                    style: GoogleFonts.notoSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 13),),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                  child: Text(
                    'Series : C' +
                        Random().nextInt(10000).toString() +
                        '-' +
                        Random().nextInt(100).toString() +
                        '-YR' +
                        Random().nextInt(1000).toString(),
                    style: GoogleFonts.notoSans(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12),),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                  child: Text(
                    'Cost : ' + Random().nextInt(10000).toString(),
                    style: GoogleFonts.notoSans(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12),),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(child: (SizedBox())),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: ctx,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: Text(
                              "MG" + Random().nextInt(999999).toString(),
                              style: GoogleFonts.notoSans(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20)),
                            ),
                            content: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Form(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Internal Number',
                                        prefixText: 'Connector001',
                                        icon: Icon(Icons.numbers_outlined),
                                      ),
                                      style: GoogleFonts.notoSans(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Supplier Number',
                                        icon: Icon(Icons.numbers_outlined),
                                      ),
                                      style: GoogleFonts.notoSans(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                                      ),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Series',
                                        icon: Icon(Icons.numbers),
                                      ),
                                      style: GoogleFonts.notoSans(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                                child: Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  child: Text(
                    'View Detail',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black26,
                        fontSize: 10),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
