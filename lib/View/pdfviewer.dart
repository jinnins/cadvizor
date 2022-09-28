import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cadvizortestlibrary/View/sub_design_list.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;

import '../Model/Binary_model.dart';

/// Represents Homepage for Navigation
class PdfViewer extends StatefulWidget {
  final BinaryModel _subMap;

  PdfViewer(this._subMap);

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    // TODO: implement initState
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFE2E3C),
          title: Text(widget._subMap.id.toString()),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
                semanticLabel: 'Bookmark',
              ),
              onPressed: () {
                //_pdfViewerKey.currentState?.openBookmarkView();
                _pdfViewerController.zoomLevel = 3;
              },
            ),
          ],
        ),
        body: Container(
          child: SfPdfViewer.memory(
            base64Decode(widget._subMap.binary),
            onZoomLevelChanged: (PdfZoomDetails details) {
              print(details.newZoomLevel);
            },
            controller: _pdfViewerController,
          ),
        ));
  }
}

